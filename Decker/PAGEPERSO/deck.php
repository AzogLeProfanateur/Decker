<!DOCTYPE html>
<html lang="en">
<head>
    <script type="text/javascript" src="../SCRIPT/js.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
        <form id="main" method="POST" action="../SCRIPT/creerDeck.php">
            <div class="titleBox">
                <h1>Créer un deck de cartes :</h1>
            </div>
            <div class="inputBox">
                <input class="inputName" type="text" placeholder="Nom du Deck" name="NomDeck">
            </div>
            <input class="btn" type="submit" value="Créer le deck">

            <form action="../" method="post">
                <select id="listeDeck">


                </select>

                <button onClick="createOption()">Raffraichir</button>

            </form>
            <?php

            ?>
            </form>
            <h1>inserez les cartes dans le deck </h1>
            <form action="../SCRIPT/insererCarte.php" method="post">
                <input type="text" placeholder="entrez un id de Carte" name="carte">
                <input type="text" placeholder="entrez un id de Deck" name="deck">
                <input type="submit" value="valider">
            </form>

            


           
        </section>
</body>
</html>