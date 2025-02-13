// --------------------------- AUDIO

// dans source on a chemin_musique//titre//chemin_image//pseudo//duree//email//id

const audio = document.getElementById("myAudio");
const imgID = document.getElementById("poster_master_play");
const hcinq = document.getElementById("titre");
const duree = document.getElementById("currentEnd");

var email = '';
var ID = 0;

function setEmail(source){
var tableau = source.split("//");
email = tableau[5];
}
function setID(source){
var tableau = source.split("//");
ID = tableau[6];
}

function audioPlay(source){
audio.currentTime = 0;
var tableau = source.split("//");
audio.src = tableau[0];
audio.pause();
audio.load();
audio.play();

 // php/request.php/tweets/ login=...&text=... Ajout d’un tweet
  var rekete = './request_history.php/results/';
  var params = 'id='+ID+'&email='+email;
  console.log(rekete);
  console.log(params);
  ajaxRequest('POST', rekete, updateList,params);
}

function imageSet(source){
var tableau = source.split("//");
console.log(tableau);
imgID.src = tableau[2];
}
function titreSet(source){
var tableau = source.split("//");
hcinq.innerHTML = tableau[3]+'<div class="subtitle">'+tableau[1]+'</div>';
}

function dureeSet(source){
var tableau = source.split("//");
duree.innerHTML = Math.floor(tableau[4]/60)+':'+tableau[4]%60;
}

//if (audio.paused) {
//} else {
//}




// --------------------------- PLAY/PAUSE

var elements = document.querySelectorAll('.countPlay');
var count = elements.length;
var inc = 1;
console.log('Nombre d\'éléments avec la classe "maClasse": ' + count);

var isPlaying3 = [];
for (var i = 0; i < count; i++) {
  var value = false;
  isPlaying3.push(value);
}

var donotclean = 0;
for (var i = 0; i <count; i++){
document.getElementsByClassName('playkk'+inc)[0].addEventListener("click", function(event) {
  event.preventDefault();
  cleanElements();
  this.classList.toggle("play");
    if (this.classList.contains('play')) 
  setEmail(this.getAttribute("href"));
  setID(this.getAttribute("href"));
  audioPlay(this.getAttribute("href"));
  imageSet(this.getAttribute("href"));
  titreSet(this.getAttribute("href"));
  dureeSet(this.getAttribute("href"));
  if(!donotclean){
  clickFooter();
  donotclean=1;
  }
  
  if (isPlaying3[i]) {
    isPlaying3[i] = false;
updateElements();
  } else {
    isPlaying3[i] = true;
updateElements();
  }
});
inc = inc +1;
}

function clickFooter(){
var link = document.getElementById('play-click');
link.click();
}


function updateElements() {
  var elements = document.querySelectorAll('.countPlay');
  
  for (var i = 0; i < elements.length; i++) {
    var element = elements[i];
    
    if (element.classList.contains('play')) {
    element.innerHTML = '<img src="../html/image/pause.png">';
    }
    else{
    element.innerHTML = '<img src="../html/image/play.png">';
    }
  }
}

function cleanElements() {
  var elements = document.querySelectorAll('.countPlay');
  
  for (var i = 0; i < elements.length; i++) {
    var element = elements[i];
    
    if (element.classList.contains('play')) {
      element.classList.toggle("play");
    }
  }
}



// ---------------------------------- FOOTER 

/*ajoute la class play, et change l'image en pause, et inversement*/
const play = document.getElementsByClassName('play-music')[0];
var isPlaying = false;
var firstplay = 0;

play.addEventListener("click", function(event) {
  event.preventDefault();
  this.classList.toggle("play");
  
  if (isPlaying) {
    play.style.backgroundImage = 'url("../html/image/play.png")';
    isPlaying = false;
    audio.play();
  } else {
    play.style.backgroundImage = 'url("../html/image/pause.png")';
    isPlaying = true;
    donotclean = 0;
    if(firstplay)
    audio.pause();
    firstplay = 1;
  }
});



// ---------------------------------- MUSIC 
const play2 = document.getElementsByClassName('play-music2')[0];
var isPlaying2 = false;

play2.addEventListener("click", function(event) {
  event.preventDefault();
  this.classList.toggle("play");
  clickFooter();
  
  if (isPlaying2) {
    play2.style.backgroundImage = 'url("../html/image/play.png")';
    isPlaying2 = false;
    audio.pause();
  } else {
  setEmail(this.getAttribute("href"));
  setID(this.getAttribute("href"));
  audioPlay(this.getAttribute("href"));
  imageSet(this.getAttribute("href"));
  titreSet(this.getAttribute("href"));
  dureeSet(this.getAttribute("href"));
    play2.style.backgroundImage = 'url("../html/image/pause.png")';
    isPlaying2 = true;
  }
});

// ----------------------------------------------- AJAX


//------------------------------------------------------------------------------
//--- ajaxRequest --------------------------------------------------------------
//------------------------------------------------------------------------------
// Perform an Ajax request.
// \param type The type of the request (GET, DELETE, POST, PUT).
// \param url The url with the data.
// \param callback The callback to call where the request is successful.
// \param data The data associated with the request.


var nb_result = 6;
function updateList(results)
{
}

function ajaxRequest(type, url, callback, data = null)
{
  let xhr;

  // Create XML HTTP request.
  xhr = new XMLHttpRequest();
  if (type == 'GET' && data != null)
    url += '?' + data;
  xhr.open(type, url);
  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

  // Add the onload function.
  xhr.onload = () =>
  {
    switch (xhr.status)
    {
      case 200:
      case 201:
        console.log(xhr.responseText);
        callback(JSON.parse(xhr.responseText));
        break;
      default:
        httpErrors(xhr.status);
    }
  };

  // Send XML HTTP request.
  xhr.send(data);
}





//------------------------------------------------------------------------------
//--- httpErrors ---------------------------------------------------------------
//------------------------------------------------------------------------------
// Display an error message accordingly to an error code.
// \param errorCode The error code (HTTP status for example).
function httpErrors(errorCode)
{
  let messages =
  {
    400: 'Requête incorrecte',
    401: 'Authentifiez vous',
    403: 'Accès refusé',
    404: 'Page non trouvée',
    500: 'Erreur interne du serveur',
    503: 'Service indisponible'
  };

  // Display error.
  if (errorCode in messages)
  {
   // document.getElementById['errors'].innerHTML ='<i class="fa fa-exclamation-circle"></i> <strong>'+messages[errorCode] + '</strong>';
  }
}
