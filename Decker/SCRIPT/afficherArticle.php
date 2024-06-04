<?php include '../SCRIPT/liaison.php';
$requete2 = $liaison->query("SELECT SELECT NomArticle,ContenuArticle,LibelSujet FROM article AS A INNER JOIN concerner AS C ON A.IdArticle = C.IdArticle INNER JOIN sujet AS S ON C.IdSujet = S.IdSujet;");
$result = $requete2->fetchAll();
echo json_encode($result);
?>

