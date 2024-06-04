let deckEnCours;

function afficherDeck(){
    $.ajax({
        url: 'https://decker.alwaysdata.net/decker/SCRIPT/afficherDeck.php',
        type: 'POST',
        async: false,
        success: function(data, statut){
            let mesDecks = JSON.parse(data);
            let maDiv = document.getElementById("listeDeck");
            var compteur = 0;
            maDiv.innerHTML = "";
            mesDecks.forEach(deck => {
                //let monForm = document.createElement("FORM");
                let PNomDeck = document.createElement("P");
                let PMatricule = document.createElement("P");
                let PSujet = document.createElement("P");
                let PIdDeck = document.createElement("INPUT");
                let monBouton = document.createElement("BUTTON");
                monBouton.innerHTML = "Faire l'exercice";
                PIdDeck.setAttribute("name", "IdDeck");
                monBouton.addEventListener("click", function(){
                    afficherCarte(deck.IdDeck);
                    clearForExercice()
                });
                PNomDeck.innerText = deck.NomDeck;
                PMatricule.innerText = deck.MatriculeEmploye;
                PSujet.innerText = deck.LibelSujet;
                PIdDeck.value = deck.IdDeck;
                PIdDeck.type = "hidden";
                maDiv.appendChild(PIdDeck);
                maDiv.appendChild(PNomDeck);
                maDiv.appendChild(PMatricule);
                maDiv.appendChild(PSujet);
                maDiv.appendChild(monBouton);
                compteur++;
            });
        }
    })
}

function afficherCarte(idDeck){
    $.ajax({
        url: 'https://decker.alwaysdata.net/decker/SCRIPT/afficherExercice.php',
        type: 'POST',
        data: 'IdDeck=' + idDeck,
        success: function(data, statut){
            let mesCartes = JSON.parse(data);
            let mesData = {
                carteEnCours : 0,
                mesCartes : mesCartes
            };
            deckEnCours = mesData;
        }

    })
}

function chargerCarte(IdCarte){
    let monRetour;
    $.ajax({
        url: 'https://decker.alwaysdata.net/decker/SCRIPT/chargerCarte.php',
        type: 'POST',
        async: false,
        data: 'IdCarte=' + IdCarte,
        success: function(data, statut){
            monRetour = JSON.parse(data);
        }
    });
    return monRetour;
}

function clearForExercice(){
    document.body.innerHTML = "";
    let button = document.createElement("BUTTON");
    button.addEventListener("click", function() {
        afficherExercice();
    })
    button.innerHTML = "Commencer";
    document.body.appendChild(button);
}
var numCEC;
async function afficherExercice(){
    if(deckEnCours.carteEnCours < deckEnCours.mesCartes.length){
    document.body.innerHTML = "";
    let maCarte = chargerCarte(deckEnCours.mesCartes[deckEnCours.carteEnCours].IdCarte);
    let i = 0;
    let nbDevine1 = 0;
    let maDiv = document.createElement("DIV");
    maDiv.setAttribute("id", "main");
    while(maCarte.length > i){
        if(maCarte[i].Devine == 0){
        let PTexte = document.createElement("P")
        PTexte.innerHTML += " " + maCarte[i].Partie_Texte;
        document.body.appendChild(maDiv);
        maDiv.appendChild(PTexte);
        }else{
        let IRep = document.createElement("INPUT");
        IRep.setAttribute("id", "reponse"+nbDevine1);
        document.body.appendChild(maDiv);
        maDiv.appendChild(IRep);
        nbDevine1++;
        }
        i++;
    }
    let BRepondre = document.createElement("BUTTON");
    BRepondre.innerHTML = "Repondre";
    let j = 0;
    BRepondre.addEventListener("click", function(){
        while(j < nbDevine1){
        maRep = document.getElementById("reponse"+j).value;
        Reponse(maRep);
        j++;
        }
        prochainDeck()
        afficherExercice();
    })
    maDiv.appendChild(BRepondre);
    }else{
        document.body.innerHTML = "";
        let BResultat = document.createElement("BUTTON");
        BResultat.innerHTML = "Voir les résultats";
        BResultat.addEventListener("click", function(){
            afficherReponse();
    });
    document.body.appendChild(BResultat);

    }
    
};
var correc = "";
var correcTotal = "";
function afficherReponse(){
    document.body.innerHTML = "";
    let BResultat = document.createElement("BUTTON");
        BResultat.innerHTML = "Voir les résultats";
        BResultat.addEventListener("click", function(){
            afficherReponse();
    })
    let maDivGe = document.createElement("DIV");
    maDivGe.setAttribute("id", "main");
    document.body.appendChild(maDivGe);
    let maDivCorrec = document.createElement("DIV");
    maDivCorrec.setAttribute("id", "BonneRep");
    maDivGe.appendChild(maDivCorrec);
    let h1 = document.createElement("H1");
    h1.innerHTML = "Vos bonnes réponses :";
    maDivCorrec.appendChild(h1);

    let maDivCorrecF = document.createElement("DIV");
    maDivCorrecF.setAttribute("id", "MauvaiseRep");
    maDivGe.appendChild(maDivCorrecF);
    let h1F = document.createElement("H1");
    h1F.innerHTML = "La correction :";
    maDivCorrecF.appendChild(h1F);
    for (let c = 0; c < deckEnCours.mesCartes.length; c++) {
        let numRep = 0;
        for (let k = 0; k < deckEnCours.mesCartes[c].reponses.length; k++) {
            $.ajax({
                url: 'https://decker.alwaysdata.net/decker/SCRIPT/recupCorrection.php',
                type: 'POST',
                async: false,
                data: 'idCarte='+ deckEnCours.mesCartes[c].IdCarte +'&compteur='+ numRep,
                success: function(data, statut){
                    correc = JSON.parse(data);
                }
            })     
            $.ajax({
                url: 'https://decker.alwaysdata.net/decker/SCRIPT/recupTotalCorrection.php',
                type: 'POST',
                async: false,
                data: 'idCarte='+ deckEnCours.mesCartes[c].IdCarte,
                success: function(data, statut){
                    correcTotal = JSON.parse(data);
                }
            })
            if(deckEnCours.mesCartes[c].reponses[k] == correc.Partie_Texte){
                let divReponseJuste = document.createElement("DIV");
                for (let l = 0; l < correcTotal.length; l++) {
                    let PCorrec = document.createElement("P");
                    if(correcTotal[l]['Partie_Texte'] == deckEnCours.mesCartes[c].reponses[k]){
                    PCorrec.innerHTML += correcTotal[l]['Partie_Texte'];
                    PCorrec.style.color = "green"
                    divReponseJuste.appendChild(PCorrec);
                }else{
                    PCorrec.innerHTML += correcTotal[l]['Partie_Texte'];
                    divReponseJuste.appendChild(PCorrec);
                    }
                }
                let maDiv = document.getElementById("BonneRep");
                maDiv.appendChild(divReponseJuste);
                console.log("Réussi");
            }else{
                let maDivFausse = document.getElementById("MauvaiseRep")
                let uneDiv = document.createElement("DIV");
                for (let l = 0; l < correcTotal.length; l++) {
                    let PCorrecF = document.createElement("P");
                    // if(l <= deckEnCours.mesCartes[c].reponses.length && correcTotal[l]['Devine'] == 1 && correc.Partie_Texte != deckEnCours.mesCartes[c].reponses[k]){
                    //     PCorrecF.innerHTML += deckEnCours.mesCartes[c].reponses[l];
                    //     PCorrecF.style.color = "blue";
                    // }else{
                        PCorrecF.innerHTML += correcTotal[l]['Partie_Texte'];
                    uneDiv.appendChild(PCorrecF);
                }
                maDivFausse.appendChild(uneDiv);
                console.log("Raté");
            }
            numRep++;
        }
    }
}

function prochainDeck(){
    deckEnCours.carteEnCours = deckEnCours.carteEnCours > deckEnCours.mesCartes.length ? deckEnCours.carteEnCours : deckEnCours.carteEnCours + 1;
};

function precedentDeck(){
    deckEnCours.carteEnCours = deckEnCours.carteEnCours != 0 ? 0 : deckEnCours.carteEnCours + 1;
};

function Reponse(id){
    if(!deckEnCours.mesCartes[deckEnCours.carteEnCours].hasOwnProperty("reponses"))
    {
        deckEnCours.mesCartes[deckEnCours.carteEnCours].reponses = [];
    }
    if(!deckEnCours.mesCartes[deckEnCours.carteEnCours].reponses.includes(id)){
        deckEnCours.mesCartes[deckEnCours.carteEnCours].reponses.push(id);
    }
};

function afficherCarte()


var currentNumber = 2;
            const mainDiv = document.getElementsByClassName("mainDiv")[0];
            function swipe(){
                let currentDiv = document.getElementsByClassName("current")[0];
                let nextDiv = document.getElementsByClassName("next")[0];
                currentDiv.classList.toggle("current");
                currentDiv.classList.toggle("previous");
                currentNumber++;
                nextDiv.classList.toggle("next");
                nextDiv.classList.toggle("current");
                let fNextDiv = document.createElement("DIV");
                fNextDiv.innerHTML = currentNumber;
                fNextDiv.classList.toggle("next");
                mainDiv.appendChild(fNextDiv);
            }



