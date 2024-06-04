<?php include '../SCRIPT/liaison.php';
$idCarte = $_POST['IdCarte'];
$requete = $liaison->prepare("SELECT IdTexte,Partie_Texte,Devine FROM Texte WHERE IdCarte = ? ORDER BY Numero_Ordre");
$requete->bindParam(1, $idCarte);
$requete->execute();
$result = $requete->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);
?>