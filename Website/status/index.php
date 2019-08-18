<?php

    try {
	$conn = new SoapClient(NULL, array(
            'location' => "http://127.0.0.1:7878/",
            'uri'      => 'urn:TC',
            'style'    => SOAP_RPC,
            'login'    => 'soap',
            'password' => 'X'
        ));
	echo $conn->executeCommand(new SoapParam('server info', 'command'));
    } catch (Exception $e) {
        print_r($e);
    }
?>