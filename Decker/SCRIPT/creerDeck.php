<?php include '../SCRIPT/liaison.php';
session_start();
$nomDeck = $_POST['NomDeck'];
$requeteCreer = $liaison->prepare("INSERT INTO Deck(NomDeck,MatriculeEmploye)  VALUES(:NomDeck,:MatriculeEmploye)");
$requeteCreer->bindParam('NomDeck',$nomDeck,PDO::PARAM_STR);
$requeteCreer->bindParam('MatriculeEmploye',$_SESSION['matriculeUti'],PDO::PARAM_STR);
$requeteCreer->execute();
header("Location: ../PAGEPERSO/deck.php");
?>