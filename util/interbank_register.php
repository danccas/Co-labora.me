<?php




$cmd = "curl 'https://apis.interbank.pe/eureca/api/debt/service/DEPARTAMENTOS/debtor?_=1590624528742' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Authorization: bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaWQiOiI4OCIsInJ1YyI6IjIwNjAyNDk3NTE5IiwicHJmbCI6IjAiLCJleHAiOjE1OTA2MjYwOTYsImlzcyI6IkV1cmVjYSIsImF1ZCI6IkV1cmVjYSJ9.U_nwKSW6O0K8GP_LmhiCPeQAazC50AwvziIOLwotYKg' \
  -H 'Ocp-Apim-Subscription-Key: c9664a560c184e8cb857e5d2a7efabc4' \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Cache-Control: no-cache' \
  -H 'Ocp-Apim-Trace: true' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36' \
  -H 'Expires: Sat, 01 Jan 2000 00:00:00 GMT' \
  -H 'Origin: https://cobrosimple.interbank.pe' \
  -H 'Sec-Fetch-Site: same-site' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Referer: https://cobrosimple.interbank.pe/home' \
  -H 'Accept-Language: en,es;q=0.9,la;q=0.8,ha;q=0.7,fr;q=0.6,gl;q=0.5,und;q=0.4,ja;q=0.3' \
  --data-binary '{\"emissionDate\":\"2020-05-27T05:00:00.000Z\",\"dueDate\":\"2020-05-31T05:00:00.000Z\",\"code\":\"132546\",\"firstName\":\"DEMO01\",\"concept\":\"DEMO02\",\"amount\":\"20.00\"}' \
  --compressed";

$rp = exec($cmd);


echo $rp;
