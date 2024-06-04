<?php include './liaison.php';
 
$contenu = $_POST['contenu'];
$nomArt = $_POST['nomArticle'];
$ajoutArticle = $liaison->prepare("INSERT INTO Article(:NomArticle,:ContenuArticle) VALUES(?,?)");
$ajoutArticle->bindParam('NomArticle',$nomArt,PDO::PARAM_STR);
$ajoutArticle->bindParam('ContenuArticle',$contenu,PDO::PARAM_STR);
$ajoutArticle->execute();
?>