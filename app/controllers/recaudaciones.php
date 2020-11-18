<?php

Identify::direccionar_no_logueado();

Route::library('formity2');
Route::library('socket');
Route::library('recaudacion');

$db = Doris::init('colabora');

$next = $db->get("SELECT COUNT(*) as cantidad FROM recaudacion WHERE usuario_id = " . Identify::g()->id, true);

$ls = $db->get("SELECT * FROM area ORDER BY nombre ASC");
$ls = result_parse_to_options($ls, 'id', 'nombre');

$time_default = time() + 60*60;
$form = Formity::getInstance('recaudacion');
$form->setTitle('Recaudación');
$form->addField('nombre', 'input:text')->setValue('Recaudación #' . ($next['cantidad'] + 1));
$form->addField('codigo:Código', 'input:text')->setRegex('[\w\-\_]+')->setMin(5)->setMax(50);
$form->addField('fecha_hasta:Límite', 'input:date')->setValue(date('Y-m-d', $time_default));
$form->addField('hora_hasta:Límite', 'input:time')->setValue(date('H:i', $time_default));
$form->addField('monto_limite?:Límite', 'input:number')->setStep(1);

#$form->getField('nombre')->onChange(function($form) {
#  $form->getData();
#  $form->getField('codigo')->setValue('123');
#});

$ls = $db->get("SELECT * FROM dificultad ORDER BY nombre ASC");
$ls = result_parse_to_options($ls, 'id', 'nombre');
$form->addField('privacidad', 'select')->setOptions(array(
  1 => 'Público',
  2 => 'Privado',
))->setValue(1);

Route::any('', function() use($db) {
  $table = Tablefy::getInstance('recaudaciones');
  $table->setTitle('Relación de recaudaciones');
  $table->setHeader(array('NOMBRE', 'CÓDIGO', 'PRIVACIDAD','INICIADO','HASTA','ESTADO','RECAUDADO'));
  $table->setData(function($e) use($db) {
    return $db->pagination("
      SELECT
        F.*,
        A.nombre as area
      FROM recaudacion F
      LEFT JOIN area A ON A.id = F.area_id
      WHERE F.usuario_id = " . Identify::g()->id . "
      ORDER BY id ASC", $e);
  }, function($n) {
    $n = recaudacion_to_human($n);
    return array(
      $n['nombre'],
      $n['codigo'],
      $n['privacidad'] == 1  ? '<span class="tag">Público</span>' : '<span class="tag">Privado</span>',
      tiempo_transcurrido($n['fecha_desde']),
      fecha($n['fecha_hasta'], true),
      $n['estado_html'],
      $n['monto_recaudado'],
      'tb_options' => in_array($n['estado'], array(RECAUDACION_PENDIENTE, RECAUDACION_ATRASADO)) ? array('editar','studio') : array('studio'),
    );
  });
  $table->setOption('studio', '/recaudaciones/info/:codigo');
  $table->setOption('editar&', function($n) use($db) {
    $n = recaudacion_to_human($n);
    $form = Formity::getInstance('recaudacion');
    if(!in_array($n['estado'], [RECAUDACION_PENDIENTE, RECAUDACION_ATRASADO])) {
      $form->removeField('fecha_limite');
      $form->removeField('hora_limite');
      $form->removeField('monto_limite');
    }
    if($form->byRequest()) {
      if($form->isValid()) {
        $data = $form->getData();
        if(!empty($data['fecha_programada'])) {
          $data['fecha_programada'] = $data['fecha_programada'] . ' ' . $data['hora_programada'];
          unset($data['hora_programada']);
        }
        $db->update('recaudacion', $data, 'id = ' . $n['id']);
        Route::go2Back();
      }
    } else {
      $form->setPreData($n);
    }
    Route::setTitle('#Cuestionarios');
    Route::setDescription('Se muestra la relación de recaudaciones registrados.');
    Route::render($form);
  });
  $table->prepare();
  Route::setTitle('#MisRecaudaciones');
  Route::setDescription('Se muestra la relación de recaudaciones registradas');
  Route::nav('Nuevo&', function() use($db) {
    $form = Formity::getInstance('recaudacion');
    if($form->byRequest()) {
      if($form->isValid()) {
        $data = $form->getData();
        $existe = $db->get("SELECT * FROM recaudacion WHERE codigo = :codigo", false, null, array(
          'codigo' => $data['codigo'],
        ));
        if(!empty($existe)) {
          $form->setError('El código ingresado ya existe.');
        } else {
          $data['fecha_desde'] = Doris::time();
          $data['fecha_hasta'] = $data['fecha_hasta'] . ' ' . $data['hora_hasta'];
          unset($data['hora_hasta']);
          $data['usuario_id'] = Identify::g()->id;
          $form_id = $db->insert('recaudacion', $data);
          Route::refresh();
  //        Route::go2Back();
        }
      }
    }
    Route::render($form);
  });
  Route::render($table);
});
Route::any('info/:codigo', array('codigo' => '[\w\-\_]+'), function($route) use($db) {
  $recaudacion = $db->get("SELECT * FROM recaudacion WHERE usuario_id = :usuario AND codigo = :codigo", true, null, array(
    'usuario' => Identify::g()->id,
    'codigo'  => $route['codigo'],
  ));
  if(empty($recaudacion) && $recaudacion['usuario_id'] != Identify::g()->id) {
    _404();
  }
  $recaudacion = recaudacion_to_human($recaudacion);
  Route::theme('recaudacion', $recaudacion);
});
