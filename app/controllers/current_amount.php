<?php

Identify::direccionar_no_logueado();

Route::library('recaudacion');

$db = Doris::init('colabora');


$usuario = $db->get('SELECT * FROM usuario WHERE id = ' . Identify::g()->id, true);

Route::responseJSON(200, array(
  'amount' => $usuario['monto'],
));
