<?php $this->titre = "Creation compte "  ?>

<?php echo $msg; ?>

<form method="post" action="index.php?action=compte">
    <input type="text" name="nom" id=""> <br><br>
    <input type="text" name="prenom" id=""> <br><br>
    <input type="text" name="email" id=""> <br><br>
    <input type="text" name="passw1" id=""> <br><br>
    <input type="text" name="passw2" id=""> <br><br>
    <input type="submit" value="singup" name="singup">
</form>


<br>
<hr>
<br>
<form method="post" action="index.php?action=compte">

    <input type="text" name="email" id=""> <br><br>
    <input type="text" name="passw" id=""> <br><br>
  
    <input type="submit" value="login" name="login">
</form>
<br><br> <hr> <br>
    <a href="index.php?action=logout"><button>Logout</button></a>

