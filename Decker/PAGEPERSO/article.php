<!DOCTYPE html>
<html lang="en">

<head>
    <script type="text/javascript" src="../SCRIPT/js.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="../STYLE/style.css">
</head>

<body>
    <div id="menu">
        <a href="../SCRIPT/deconnexion.php">Deconnexion</a>
        <a href="../index.php">Accueil</a>
        <a href="./article.php">Vos articles</a>
        <a href="./deck.php">Vos decks</a>
        <a href="../PAGECOMMUNE/listeDeck.php">Exercice</a>
        <a href="../PAGECOMMUNE/documentation.php">Documentation</a>
    </div>
    <form id="main" method="POST" action="">
        <div class="titleBox">
            <h1>Rédigez Article :</h1>
        </div>
        <div class="inputBox">
            <input class="inputName" type="text" placeholder="Nom de l'article" name="nomArticle">
            <textarea class="inputName2" placeholder="Rédigez l'article" name="contenu"></textarea>

        </div>
        <input class="btn" type="submit" value="Créer l'article">
    </form>
</body>

</html>