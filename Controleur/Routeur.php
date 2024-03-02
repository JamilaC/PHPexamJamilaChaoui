<?php

require_once 'Controleur/ControleurAccueil.php';
require_once 'Controleur/ControleurBillet.php';
require_once 'Controleur/ControleurAuteur.php';
require_once 'Vue/Vue.php';
class Routeur {

    private $ctrlAccueil;
    private $ctrlBillet;
    private $ctrlAuteur;

    public function __construct() {
        $this->ctrlAccueil = new ControleurAccueil();
        $this->ctrlBillet = new ControleurBillet();
        $this->ctrlAuteur = new ControleurAuteur();
    }

    // Route une requête entrante : exécution l'action associée
    public function routerRequete() {
        try {
            if (isset($_GET['action'])) {
                if ($_GET['action'] == 'billet') {
                    $idBillet = intval($this->getParametre($_GET, 'id'));
                    if ($idBillet != 0) {
                        $this->ctrlBillet->billet($idBillet);
                    }
                    else
                        throw new Exception("Identifiant de billet non valide");
                }
                else if ($_GET['action'] == 'commenter') {
                    $auteur = $this->getParametre($_POST, 'auteur');
                    $contenu = $this->getParametre($_POST, 'contenu');
                    $idBillet = $this->getParametre($_POST, 'id');
                    $this->ctrlBillet->commenter($auteur, $contenu, $idBillet);
                }else if ($_GET['action'] == 'compte') {
                    if(isset($_POST['singup'])){
                        $nom = $this->getParametre($_POST, 'nom');
                        $prenom = $this->getParametre($_POST, 'prenom');
                        $email = $this->getParametre($_POST, 'email');
                        $passw1 = $this->getParametre($_POST, 'passw1');
                        $passw2 = $this->getParametre($_POST, 'passw2');
                    if($passw1==$passw2){
                        $passw1=md5($passw1);
                        $this->ctrlAuteur->create($nom, $prenom, $email,$passw1);
                    }
                    }elseif (isset($_POST['login'])) {
                        $email = $this->getParametre($_POST, 'email');
                        $passw = $this->getParametre($_POST, 'passw');
                        $passw=md5($passw);
                        $this->ctrlAuteur->login($email,$passw);
                    }else {
                        $this->ctrlAuteur ->singup();
                    }
                    
                    
                    
                }else if ($_GET['action'] == 'logout') {
                   session_start();
                   session_unset();
                   session_destroy();
                   $this->ctrlAccueil->accueil();
                }else if ($_GET['action'] == 'create') {
                    if(isset($_POST['ajouter'])){
                        $titre = $this->getParametre($_POST, 'titre');
                        $contenu = $this->getParametre($_POST, 'contenu');
                        $iduser = $this->getParametre($_POST, 'iduser');
                        $this->ctrlBillet->addBillet( $titre,$contenu,$iduser);
                    }else{
                        $this->ctrlBillet->create();
                    }
                 }
                else
                    throw new Exception("Action non valide");
            }
            else {  // aucune action définie : affichage de l'accueil
                $this->ctrlAccueil->accueil();
            }
        }
        catch (Exception $e) {
            $this->erreur($e->getMessage());
        }
    }

    // Affiche une erreur
    private function erreur($msgErreur) {
        $vue = new Vue("Erreur");
        $vue->generer(array('msgErreur' => $msgErreur));
    }

    // Recherche un paramètre dans un tableau
    private function getParametre($tableau, $nom) {
        if (isset($tableau[$nom])) {
            return $tableau[$nom];
        }
        else
            throw new Exception("Paramètre '$nom' absent");
    }

}
