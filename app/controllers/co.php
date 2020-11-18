<?php

Route::library('formity2');
Route::library('socket');
Route::library('recaudacion');

$db = Doris::init('colabora');

Route::any(':codigo', array('codigo' => '[\w\-\_]+'), function($route) use($db) {
  $recaudacion = $db->get("
    SELECT
      S.*,
      U.nombres as usuario_nombres
    FROM recaudacion S
      JOIN usuario U ON U.id = S.usuario_id
    WHERE S.codigo = :codigo", true, null, array(
    'codigo'  => $route['codigo'],
  ));
  if(empty($recaudacion)) {
    _404();
  }
  if($recaudacion['usuario_id'] == Identify::g()->id) {
    //Route::redirect('/recaudaciones/info/' . $recaudacion['codigo']);
  }
  $recaudacion = recaudacion_to_human($recaudacion);
  Route::addMeta('title', $recaudacion['nombre'] . ' de ' . $recaudacion['usuario'] . ' | #AprendoSpace');
  Route::theme('co', $recaudacion);
});
