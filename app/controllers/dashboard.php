<?php

Identify::direccionar_no_logueado();

Route::library('dashboard');
Route::library('chartjs');

$db = Doris::init('colabora');

$sesiones = $db->get("
  SELECT
    S.*,
    U.celular
  FROM recaudacion S
    JOIN usuario U ON U.id = S.usuario_id
  WHERE S.privacidad = 1 AND S.fecha_desde IS NOT NULL AND S.fecha_hasta IS NULL
  ORDER BY S.fecha_desde DESC
  LIMIT 10");


Route::theme('dashboard', array(
  'sesiones' => $sesiones,
));
