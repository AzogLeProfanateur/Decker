<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="./STYLE/style.css">

</head>

<body>
    <h1>Decker | Connexion </h1>
        <form id="main" method="POST" action="./SCRIPT/connexion.php">
            <div class="titleBox">
                <h1>Connectez vous :</h1>
                <p><!-- On pourra mettre les erreur quand le mdp est pas bon dans ce bloc --></p>
            </div>
            <div class="inputBox">
                <input class="inputI" type="text" name="matriculeUti">
                <p class="inputName">Identifiant Employé</p>
            </div>
            <div class="inputBox">
                <input class="inputI" type="password" name="mdpUti">
                <p class="inputName">MOT DE PASSE</p>
            </div>
            <input class="btn" type="submit" value="Se Connecter">
            </form>
        </section>
</body>

<footer>
    <!-- AJouter Scrpit.js si nessécaire -->
</footer>
 