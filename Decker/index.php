<!DOCTYPE html>
<head>
    <script type="text/javascript" src="./SCRIPT/js.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="./STYLE/style.css">
</head>
<?php
session_start();
if($_SESSION['matriculeUti'] == ""){
    header("Location: ./pageCo.php");
}
?>

<div id="menu">
    <a href="./SCRIPT/deconnexion.php">Deconnexion</a>
    <a href="./PAGEPERSO/index.php">Accueil</a>
    <a href="./PAGEPERSO/article.php">Vos articles</a>
    <a href="./PAGEPERSO/deck.php">Vos decks</a>
    <a href="./PAGECOMMUNE/listeDeck.php">Exercice</a>
    <a href="./PAGECOMMUNE/documentation.php">Documentation</a>
<div>
<div>
    
</div>