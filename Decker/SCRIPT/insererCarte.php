<?php include '../SCRIPT/liaison.php';
session_start();
$idDeck = $_POST['deck'];
$idCarte = $_POST['carte'];
$insererCarte = $liaison->prepare("INSERT INTO Posseder(IdDeck,IdCarte) VALUES(?,?)");
$insererCarte->bindParam(1,$idDeck,PDO::PARAM_INT);
$insererCarte->bindParam(2,$idCarte,PDO::PARAM_INT);
$insererCarte->execute();
header('location: ../PAGEPERSO/deck.php');
?>