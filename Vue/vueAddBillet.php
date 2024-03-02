<?php $this->titre = "Mon Blog - "  ?>

<?php echo $msg; ?>
<?php session_start();  if(isset($_SESSION['userid'])){?>
<form method="post" action="index.php?action=create">
    <input id="titre" name="titre" type="text" 
           required /><br /><br>
    <textarea id="" name="contenu" 
              placeholder="Votre contenu" required></textarea><br />
    <input type="hidden" name="iduser" value="<?= $_SESSION['userid'] ?>" />
    <input type="submit" name="ajouter" value="Ajouter" />
</form>
<?php } else {
    echo "login to create post ::::";
}?>