<?php

define('RECAUDACION_INICIADO', 1);
define('RECAUDACION_FINALIZADO', 2);
define('RECAUDACION_CANCELADO', 3);
define('RECAUDACION_ANULADO', 4);
define('RECAUDACION_LIMITE', 5);


function recaudacion_to_human($s) {
  $s['codigo_streaming'] = md5($s['codigo']);
  $x = strtotime($s['fecha_programada']);
  if($s['estado'] == RECAUDACION_FINALIZADO) {
    $s['estado_txt']  = 'Finalizado';
    $s['estado_html'] = '<span class="tag is-success">Finalizado</span>';
  } elseif($s['estado'] ==  RECAUDACION_INICIADO) {
    $s['estado_txt']  = 'Iniciado';
    $s['estado_html'] = '<span class="tag is-danger">Iniciado</span>';
  } elseif($s['estado'] == RECAUDACION_ATRASADO) {
    $s['estado_txt']  = 'Atrasado';
    $s['estado_html'] = '<span class="tag is-warning">Atrasado</span>';
  } elseif($s['estado'] == RECAUDACION_PENDIENTE) {
    $s['estado_txt']  = 'Pendiente';
    $s['estado_html'] = '<span class="tag is-warning">Pendiente</span>';
  } else {
    $s['estado_txt']  = 'Desconocido';
    $s['estado_html'] = '<span class="tag is-warning">--</span>';
  }
  return $s;
}
function otorgar_bono_de_bienvenida($db, $id, $bono) {
  $db->transaction();
  $db->insert('transferencia', array(
    'desde_id'       => $id,
    'hasta_id'       => $id,
    'descripcion'    => 'Bono de Bienvenida',
  ));
  $db->exec('UPDATE usuario SET monto = monto + ' . $bono . ' WHERE id = ' . $id);
  $db->commit();
}
