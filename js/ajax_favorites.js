'use strict';

function updateList(results)
{
}

// Il y aura un faux <p> dans favorites d'id = "RetireLesFavoris"
if(document.getElementById('RetireLesFavoris')) var favorites = 1;
else favorites = 0;

var debug = 1;

// Sélectionnez l'élément <a> par son ID ou toute autre méthode de sélection
var links = document.getElementsByClassName('add-favorite');

var toadd = 0; // 0 c'est un delete des favoris, 1 c'est un ajout
var morceauID = 0; // Quel est le morceau cible
var email = '';

Array.from(links).forEach(function(link) {
  link.addEventListener('click', function(event) {
    // Empêche le comportement par défaut du lien (par exemple, la navigation vers une autre page)
    event.preventDefault();
    if(debug)console.log('Le lien a été cliqué !');


  if (link.classList) {
    var classes = Array.from(link.classList);

    // Parcourez le tableau de classes
    toadd = 0;
    var NextClassIsID = 0;
    const regex = /\d+/g; // Expression régulière pour correspondre aux nombres
    classes.forEach(function(className) {
      if(className == 'added') toadd = 1;
      if(className.includes("@"))  email = className;
      if(className.match(regex) !== null && !className.includes('@')) morceauID = className;

    if(debug) console.log('Classe:', className);
    });
  } else {
    if(debug)console.log('L\'élément ne possède pas de classes.');
  }
if(toadd){
 // php/request.php/tweets/ login=...&text=... Ajout d’un tweet
  var rekete = './request_favorites.php/results/';
  var params = 'id='+morceauID+'&email='+email;
  console.log(rekete);
  ajaxRequest('POST', rekete, updateList,params);
} else {
 // php/request.php/tweets/i?login=... Suppression du tweet
  var rekete = './request_favorites.php/results/i?id='+morceauID+'&email='+email;
  console.log(rekete);
  ajaxRequest('DELETE', rekete, updateList);
  console.log(document.getElementById(morceauID).style.display = 'none');
}
  });
});

//------------------------------------------------------------------------------
//--- ajaxRequest --------------------------------------------------------------
//------------------------------------------------------------------------------
// Perform an Ajax request.
// \param type The type of the request (GET, DELETE, POST, PUT).
// \param url The url with the data.
// \param callback The callback to call where the request is successful.
// \param data The data associated with the request.


var nb_result = 6;

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
