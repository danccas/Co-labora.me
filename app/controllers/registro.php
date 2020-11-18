<?php
Route::library('formity2');
Route::library('curly');
Route::library('api');

define('LIMITE_ENVIOS', 3);
define('LIMITE_INTENTOS', 5);

Identify::direccionar_logueado();

#if(Identify::verificacion_logeo()) {
#  header("Location: " . RAIZ_WEB);
#  exit();
#}

$db = Doris::init('colabora');

$form = Formity::getInstance('validacion');
$form->buttons = ['Volver a Enviar SMS', 'Validar'];
$form->addField('celular?', 'input:text')->disabled(true);
$form->addField('codigo?:Código', 'input:text')->setMin(4)->setMax(10);

$form_visible = 'registro';

if(!empty($_SESSION['celular'])) {
  $form_visible = 'validacion';
  if($form->byRequest()) {
    if($form->isValid($error)) {
      $form->getField('celular')->setValue($_SESSION['celular']);
      $data = $form->getData();
      $existe = $db->get("SELECT * FROM usuario WHERE celular = :celular AND validado IS NULL", true, null, array(
        'celular' => $_SESSION['celular'],
      ));
      if(empty($existe)) {
        unset($_SESSION['celular']);
        Route::redirect('/');
      } else {
        if($existe['pin_envios'] > LIMITE_ENVIOS) {
          $form->setError('Se ha superado el limite de envios permitidos, contactenos.');

        } elseif($existe['pin_intentos'] > LIMITE_INTENTOS) {
          $form->setError('Se ha superado el limite de intentos permitidos, contactenos.');

        } elseif($existe['pin_codigo'] == $data['codigo']) {
          $db->update('usuario', array(
            'validado' => Doris::time(),
          ), 'id = ' . $existe['id']);
          $rp = Identify::login($db, $_SESSION['celular'], $existe['clave'], $error);
          if(!empty($rp)) {
            Route::redirect('/');
          } else {
            _404('no-reconozco-el-error');
          }
        } elseif($form->getButton() == 0) {
          if(time() - strtotime($existe['pin_fecha']) < 60 * 5) {
            $form->setError('Vuelve a intentarlo en 5 minutos');
          } else {
            $pin = rand(10000, 99999);
            $db->update('usuario', array(
              'pin_codigo' => $pin,
              'pin_fecha'  => Doris::time(),
              'pin_envios' => $existe['pin_envios'] + 1,
            ), 'id = ' . $existe['id']);
            $operacion = infobip_send('+51' . $_SESSION['celular'], 'Tu código de verificación es: ' . $pin . '. Co-labora.me');
          }
        } else {
          $form->setError('El Código ingresado es incorrecto, tiene ' . (LIMITE_INTENTOS - $existe['pin_intentos']) . ' intentos disponibles.');
          $db->update('usuario', array(
            'pin_intentos' => $existe['pin_intentos'] + 1,
          ), 'id = ' . $existe['id']);
        }
      }
    }
  }
}

$form = Formity::getInstance('registro');
$form->setUniqueId('login');
$form->buttons = ['Registrarme'];
$form->addField('nombres', 'input:text')->setIcon('user')->setMin(10)->setMax(100);
$form->addField('pais', 'select')->setOptions(array('51' => 'Perú'));
$form->addField('celular', 'input:text')->setIcon('user')->setMin(8)->setMax(10)->setRegex('[\d]{9}');
$form->addField('clave', 'input:password')->setIcon('lock')->setMin(5)->setMax(25);

if($form->byRequest()) {
  if($form->isValid($error)) {
    $data = $form->getData();
    unset($data['pais']);
    $existe = $db->get("SELECT * FROM usuario WHERE celular = :celular", true, null, array(
      'celular' => $data['celular'],
    ));
    if(empty($existe)) {
      $pin = rand(10000, 99999);
      $form_visible = 'validacion';
      $_SESSION['celular'] = $data['celular'];
      $data['pin_codigo'] = $pin;
      $data['pin_fecha']  = Doris::time();
      $data['pin_envios'] = 1;
      $db->insert('usuario', $data);
      Formity::getInstance($form_visible)->getField('celular')->setValue($data['celular']);
      #$operacion = infobip_send('+51' . $data['celular'], 'Tu código de verificación es: ' . $pin . '. Co-labora.me');

    } elseif($existe['pin_envios'] > LIMITE_ENVIOS) {
      $form->setError('Se ha superado el limite de envios permitidos, contactenos.');

    } elseif($existe['pin_intentos'] > LIMITE_INTENTOS) {
      $form->setError('Se ha superado el limite de intentos permitidos, contactenos.');

    } elseif(empty($existe['validado'])) {
      $_SESSION['celular'] = $data['celular'];
      $form_visible = 'validacion';
      Formity::getInstance($form_visible)->getField('celular')->setValue($data['celular']);

    } else {
      $form->setError('El celular ya se encuentra registrado, ingrese por <a href="/identificacion">Aquí</a>');
    }
  }
}
Route::data('clear', true);
Route::view('registro', array(
  'form_visible' => $form_visible,
));
