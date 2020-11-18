<?php
require_once(__DIR__ . '/../conf.php');
require_once(LIBRARYS . 'curly.php');
require_once(LIBRARYS . 'recaudacion.php');

$db = Doris::init('colabora');


otorgar_bono_de_bienvenida($db, 1, 5);
