<?php include '../SCRIPT/liaison.php';
$matricule = $_POST['matriculeUti'];
$mdp = $_POST['mdpUti'];
$mdpHash = hash("SHA256",$mdp);
$sql = $liaison->prepare("SELECT MatriculeEmploye FROM Employe WHERE MatriculeEmploye = ? AND Mdp = ?");
$sql->bindParam(1,$matricule);
$sql->bindParam(2,$mdpHash);
$sql->execute(); 
$count = $sql->rowCount();
if($count > 0){
    session_start();
    $_SESSION['matriculeUti'] = $matricule;
    header("Location: ../index.php");
}else{
    header("Location: ../pageCo.php");
}
?>