<?php
Route::library('formity2');

if(isset($_GET['out'])) {
  Identify::close();
  #Route::redirect('.');
}

Identify::direccionar_logueado();

#if(Identify::verificacion_logeo()) {
#  header("Location: " . RAIZ_WEB);
#  exit();
#}

$db = Doris::init('colabora');

$form = Formity::getInstance('login');
$form->setUniqueId('login');
$form->buttons = ['Ingresar'];
$form->addField('celular', 'input:text')->setIcon('user')->setMin(8)->setMax(10);
$form->addField('clave', 'input:password')->setIcon('lock');

if($form->byRequest()) {
  if($form->isValid($error)) {
    $data = $form->getData();
#    $rp = Identify::filter('empresa_id', EMPRESA_ID);
    $rp = Identify::login($db, $data['celular'], $data['clave'], $error);
    if(!empty($rp)) {
      header("Location: " . RAIZ_WEB);
      exit();

    } else {
      $form->setError($error);
    }
  }
}
Route::data('clear', true);
Route::view('identificacion');
