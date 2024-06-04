<?php include '../SCRIPT/liaison.php';

$idCarte = $_POST['idCarte'];
$compteur = $_POST['compteur'];
$requete = $liaison->prepare("SELECT Partie_Texte FROM Texte WHERE IdCarte = ? AND Devine = 1");
$requete->bindParam(1,$idCarte);
$requete->execute();
$result = $requete->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result[$compteur]);