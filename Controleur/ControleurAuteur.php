<?php

require_once 'Modele/Auteur.php';
require_once 'Vue/Vue.php';

class ControleurAuteur {

    private $auteur;


    public function __construct() {
        $this->auteur = new Auteur();
       
    }

    public function singup() {
        
        $vue = new Vue("Auteur");
        $vue->generer(array('msg' => ''));
    }
    public function create($nom, $prenom, $email,$passw1) {
        

        $this->auteur->setAuteur($nom, $prenom, $email,$passw1);
        $vue = new Vue("Auteur");
        $vue->generer(array('msg' => 'User has been created'));
    }
    public function login( $email,$passw) {
        
        $user = $this->auteur->getAuteur($email,$passw);
        if(isset($user)){
            session_start();
        $_SESSION['userid']=$user['id'];
        $_SESSION['email']=$user['email'];
        $vue = new Vue("Auteur");
        $vue->generer(array('msg' => 'Connection done user : '.$_SESSION['userid']));
      
        }else {
            $vue = new Vue("Auteur");
            $vue->generer(array('msg' => 'Email ou mot de passe incorrect'));
        }
    }

}

