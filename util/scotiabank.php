<?php
require_once(__DIR__ . '/../conf.php');
require_once(LIBRARYS . 'curly.php');

$db = Doris::init('colabora');


$c = array(
  'id' => '',
  'nombre' => 'Cuenta',
  'referencia_id' => '-1640254758',
  'token' => '47c741dc-10d4-4b36-8fe9-e49753e4691b',
);


    echo "\n### Cuenta: " . $c['nombre'] . "\n";
    $page = 0;
    $salir = 0;
    do {
      echo "Consultando Page " . $page . "...\n";
      $url = 'https://mi.scotiabank.com.pe/digital-api/products/' . $c['referencia_id'] . '/transactions?page=' . $page;
      $rp  = Curly(CURLY_GET, $url, array(
        'Cookie' => 'JOY=' . $c['token'] . ';',
      ));
      echo "Respuesta!\n";
      if(empty($rp)) {
        echo "-- Sin respuesta --\n";
        break;
      }
      $rp = json_decode($rp, true);
      if(empty($rp)) {
        echo "-- Sin respuesta json --\n";
        break;
      }
      if(empty($rp['transactions'])) {
        echo "-- Sin transaciones --\n";
        #print_r($rp);
        break;
      }
      foreach($rp['transactions'] as $t) {
        if(empty($t['id'])) {
          echo ":: Omitiendo sin ID\n";
          continue;
        }
        if(strpos($t['description'], 'plin') === false) {
          echo ":: Omitiendo en proceso\n";
          continue;
        }
        $ex = $db->get("SELECT * FROM transferencia WHERE transaction_id = '" . $t['id'] . "'", true);
        if(empty($ex)) {
          $salir = 0;
          echo ":: Nuevo movimiento: " . $t['id'] . " [" . $t['amount'] . "]\n";
debug($t);
          $tiempo = Doris::time($t['date_formatted']);
          $db->insert('transferencia', array(
            'usuario_id'      => $c['usuario_id'],
            'cuenta_id'       => $c['id'],
            'moneda_id'       => $MONEDAS[$t['currency']],
            'referencia_id'   => $t['id'],
            'referencia_tipo' => $t['type'],
            'descripcion'     => $t['description'],
            'categoria_id'    => encontrarle_una_categoria($db, $t['description']),
            'categoria_confirmacion' => 0,
            'monto'           => $t['amount'],
            'fecha'           => $tiempo,
            'procesado'       => $tiempo,
          ));
        } else {
          echo ":: Ya registrado: " . $t['id'] . " [" . $t['amount'] . "]\n";
          $salir++;
        }
      }
      echo "[Página: " . $page . "/" . $rp['page']['total_pages'] . "]\n";
      sleep(1);
      $page++;
    } while($rp['page']['total_pages'] >= $page && $salir <= 3);
