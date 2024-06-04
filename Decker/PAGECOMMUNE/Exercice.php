<script type="text/javascript" src="../SCRIPT/js.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- /*
$count = $requete->rowCount();
echo '<form action="./correction.php" method="POST">';
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
            echo "<input type='text' name='reponse" . $monIdCarte . $i ."'>";
        }
        $i++;
    }
    $compteur++;
}
echo '</br>';
echo '<input type="submit" value="Envoie"></form>';*/ -->
