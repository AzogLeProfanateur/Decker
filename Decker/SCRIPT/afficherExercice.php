<?php include '../SCRIPT/liaison.php';
$idDeck = $_POST['IdDeck'];
$compteur = 0;
$requete = $liaison->prepare("SELECT IdCarte FROM Posseder WHERE IdDeck = ?");
$requete->bindParam(1, $idDeck);
$requete->execute();
$result = $requete->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);