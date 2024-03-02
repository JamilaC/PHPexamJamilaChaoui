<?php

require_once 'Modele/Modele.php';
/**
 * Fournit les services d'accès aux genres musicaux 
 * 
 * @author Baptiste Pesquet
 */
class Auteur extends Modele {

    public function getAuteur($email,$passw) {
        $sql = 'SELECT * FROM t_auteur where email=? and passw=?';
        $user = $this->executerRequete($sql, array($email,$passw));
        if ($user->rowCount() > 0)
            return $user->fetch();  // Accès à la première ligne de résultat
       
    }
    public function setAuteur($nom, $prenom, $email,$passw) {
        $sql = 'INSERT INTO `t_auteur`(`nom`, `prenom`, `email`, `passw`)'
            . ' values(?, ?, ?, ?)';
       
        $this->executerRequete($sql, array($nom, $prenom, $email,$passw));
    }
}