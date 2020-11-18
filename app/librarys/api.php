<?php

function infobip_send($number, $text, &$info = null) {
  $url = 'https://gyy596.api.infobip.com/sms/2/text/advanced';
  #$url = 'https://gyy596.api.infobip.com/sms/2/text/single';
  $header = array(
    'Authorization' => 'App 74ba243b11175cc4cb0cbd2042d3cb0d-03384552-7a5a-4369-a297-6bcce7b20b21',
    'Content-Type'  => 'application/json',
    'Accept'        => 'application/json',
  );
  $data = array(
    'messages' => array(
      'from' => 'Co-labora.me',
      'destinations' => array(
        array(
          'to'   => $number,
        ),
      ),
      'text' => $text,
      'flash' => true,
    ),
  );
  return Curly(CURLY_POST, $url, $header, json_encode($data), null, $info, array(
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  ));
}
