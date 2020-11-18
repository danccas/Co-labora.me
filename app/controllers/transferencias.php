<?php

Identify::direccionar_no_logueado();

Route::library('formity2');

$db = Doris::init('colabora');

Route::any('', function() use($db) {
  $table = Tablefy::getInstance('movimientos');
  $table->setTitle('Relación de Movimientos');
  $table->setHeader(array('FECHA','DE','PARA','DESCRIPCIÓN','MONTO','RECAUDACIÓN'));
  $table->setData(function($e) use($db) {
    return $db->pagination("
      SELECT
        T.*,
        U1.nombres as desde_nombres,
        U2.nombres as hasta_nombres,
        R.nombre as recaudacion_nombre
      FROM transferencia T
        LEFT JOIN usuario U1 ON U1.id = T.desde_id
        LEFT JOIN usuario U2 ON U2.id = T.hasta_id
        LEFT JOIN recaudacion_aporte RA ON RA.transferencia_id = T.id
        LEFT JOIN recaudacion R ON R.id = RA.id
      WHERE T.desde_id = " . Identify::g()->id . " OR T.hasta_id = " . Identify::g()->id . "
      ORDER BY T.id ASC", $e);
  }, function($n) {
    return array(
      fecha($n['created_on'], true),
      $n['desde_nombres'],
      $n['hasta_nombres'],
      $n['descripcion'],
      $n['monto'],
      $n['recaudacion_nombres'],
    );
  });
  $table->prepare();
  Route::setTitle('#Transferencias');
  Route::setDescription('Se muestra el historial de transferencias registradas.');
  Route::render($table);
});
