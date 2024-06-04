<?php include '../SCRIPT/liaison.php';
$requete2 = $liaison->query("SELECT DISTINCT D.IdDeck,D.NomDeck,D.MatriculeEmploye,S.LibelSujet FROM Deck D INNER JOIN Posseder P ON D.IdDeck = P.IdDeck INNER JOIN Carte C ON C.IdCarte = P.IdCarte INNER JOIN Sujet S ON S.IdSujet = C.IdSujet");
$result = $requete2->fetchAll();
echo json_encode($result);
?>