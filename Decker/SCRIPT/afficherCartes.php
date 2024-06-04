<?php include '../SCRIPT/liaison.php';
$Sujet = $_POST['sujet'];
$afficherCartes = $liaison->prepare("SELECT IdCarte,LibelCarte FROM Carte WHERE IdSujet = ?");
$afficherCartes->bindParam(1,$Sujet);
$result = $afficherCartes->fetchAll();
echo json_encode($result);

//$afficherCartes->execute();
?>