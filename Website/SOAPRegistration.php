<?php

class SOAPRegistration
{
    protected $messages = Array();
    protected $db;
    protected $soap;
    protected $showForm = true;
    
    public function __construct()
    {
        try
        {
            $this -> dbConnect();
            if ($this -> validateInput())
            {
                $this -> soapConnect();
                $this -> showForm = false;
                //Enable one or the other account/bnetaccount create lines
                //Use double slashes (like these lines) to disable the line, and remove them to enable the line
                //account = Classic-WotLK
                //bnetaccount = WoD
                //Take note the @CHANGEME on WoD, change this and tell users to add it at WoW login screen (so Espionage724 at registration = Espionage724@realmofespionage at WoW login screen)
                //$this -> soapCommand('account create '.$_POST["accountname"].' '.$_POST["password"]);
                $this -> soapCommand('bnet create '.$_POST["accountname"].'@spp '.$_POST["password"]);
                //Change addon number below if needed, else comment out
                //$this -> soapCommand('account set addon '.$_POST["accountname"].' 7');
                $stmt = $this -> db -> prepare("UPDATE `account` SET `email` = ?, `expansion` = ? WHERE `username` = ?;");
                $stmt -> bind_param('sis', $_POST["email"], $_POST["expansion"], $_POST["accountname"]);
                $stmt -> execute();
            }
        }
        catch (Exception $e)
        {
            $this -> addMessage($e -> getMessage());
        }
    }
    
    protected function validateInput()
    {
        if (empty($_POST["accountname"]))
        {
            $this -> addMessage('Please enter your desired Account Name.');
        }
        elseif (!preg_match('/^[a-z0-9]{5,32}$/i', $_POST["accountname"]))
        {
            $this -> addMessage('Your Account Name must be between 5 and 32 characters long and may only contain letters and numbers.');
        }
        else
        {
            $stmt = $this -> db -> prepare("SELECT `username` FROM `account` WHERE `username` = ?;");
            $stmt -> bind_param('s', $_POST["accountname"]);
            $stmt -> execute();
            $stmt -> store_result();
            if ($stmt->num_rows > 0)
            {
                $this -> addMessage('This Account Name is already in-use. Please choose a different name.');
            }
        }
        
        if (empty($_POST["password"]))
        {
            $this -> addMessage('Please enter your desired Password for this account.');
        }
        else
        {
            if (!preg_match('/^[a-z0-9!"#$%@]{8,128}$/i', $_POST["password"]))
            {
                $this -> addMessage('The Password must be between 8 and 128 characters long and may only contain letters, numbers and the following special characters: !"#$%@');
            }
            
            if (empty($_POST["password2"]))
            {
                $this -> addMessage('Please confirm your Password.');
            }
            elseif ($_POST["password"] !== $_POST["password2"])
            {
                $this -> addMessage('The two Passwords do not match. Please retype your Passwords.');
            }
        }
        
        if (empty($_POST["email"]))
        {
            $this -> addMessage('Please enter the Email Address you would like to associate with this Account Name.');
        }
        elseif (!filter_var($_POST["email"], FILTER_VALIDATE_EMAIL))
        {
            $this -> addMessage('The Email Address you have entered is invalid. Please try again.');
        }
        elseif (strlen($_POST["email"]) > 254)
        {
            $this -> addMessage('The Email Address can not be longer than 254 characters long.');
        }
        elseif (CHECK_FOR_DUPLICATE_EMAIL)
        {
            $stmt = $this -> db -> prepare("SELECT `email` FROM `account` WHERE `email` = ?;");
            $stmt -> bind_param('s', $_POST["email"]);
            $stmt -> execute();
            $stmt -> store_result();
            if ($stmt->num_rows > 0)
            {
                $this -> addMessage('The Email Address entered is already associated with another Account Name. Please use a different address.');
            }
        }
        
        return empty($this -> messages);
    }
    
    protected function dbConnect()
    {
        $this -> db = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
        if (mysqli_connect_errno())
        {
            throw new Exception("Database connection failed: ". mysqli_connect_error());
        }
        return true;
    }
    
    protected function soapConnect()
    {
        $this -> soap = new SoapClient(NULL, Array(
            'location'=> 'http://'. SOAP_IP .':'. SOAP_PORT .'/',
            'uri' => SOAP_URI,
            'style' => SOAP_RPC,
            'login' => SOAP_USER,
            'password' => SOAP_PASS,
            'keep_alive' => false //keep_alive only works in php 5.4.
        ));
    }
    
    protected function soapCommand($command)
    {
        $result = $this -> soap -> executeCommand(new SoapParam($command, 'command'));
        $this -> addMessage($result);
        return true;
    }
    
    protected function addMessage($message)
    {
        $this -> messages[] = $message;
        return true;
    }
    
    public function getMessages()
    {
        return $this -> messages;
    }
    
    public function showForm()
    {
        return $this -> showForm;
    }
    
    public function __destruct()
    {
        $this -> db -> close();
    }
}
