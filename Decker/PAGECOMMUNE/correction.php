<script type="text/javascript" src="../SCRIPT/js.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<?php include '../SCRIPT/liaison.php';
$idDeck = $_POST['IdDeck'];
$compteur = 0;
$requete = $liaison->prepare("SELECT IdCarte FROM Posseder WHERE IdDeck = ?");
$requete->bindParam(1, $idDeck);
$requete->execute();
$result = $requete->fetchAll();
$count = $requete->rowCount();
while($compteur < $count){
    $monIdCarte = $result[$compteur]['IdCarte'];
    $requete2 = $liaison->prepare("SELECT * FROM Texte WHERE IdCarte = ?");
    $requete2->bindParam(1, $monIdCarte);
    $requete2->execute();
    $result2 = $requete2->fetchAll();
    $count2 = $requete2->rowCount();
    $i = 0;
    echo "</br>";
    while($i < $count2){
        if($result2[$i]['Devine'] == 0){  
            echo " " . $result2[$i]['Partie_Texte'];
        }else{
            if($_POST['reponse'.$monIdCarte.$i.''] == $result2[$i]['Partie_Texte']){
                echo " " . $result2[$i]['Partie_Texte'];
                    }else{
                        echo ' Mauvaise Réponse';
                    }
        }
        $i++;
    }
    $compteur++;
}
echo '</br>';
echo '<input type="submit" value="Envoie">';
?>