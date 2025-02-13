'use strict';

//------------------------------------------------------------------------------
//--- ajaxRequest --------------------------------------------------------------
//------------------------------------------------------------------------------
// Perform an Ajax request.
// \param type The type of the request (GET, DELETE, POST, PUT).
// \param url The url with the data.
// \param callback The callback to call where the request is successful.
// \param data The data associated with the request.

var table = 'morceau';

function music(){table = 'morceau';}
function artiste(){table = 'artiste';}
function album(){table = 'album';}

function search(){
var input = document.getElementById("input_search").value;
// DEBUG
console.log('./request.php/results/?table='+table+'&input='+input);
ajaxRequest('GET', './request.php/results/?table='+table+'&input='+input, displayResults);

}

var nb_result = 6;
function displayResults(results)
{
  if ( results.length <= 6) nb_result = results.length;
  else nb_result = 6;
  var index = 0;
  if (table == 'morceau')
  for (let result of results){
    index = index + 1;
    document.getElementById('result'+index).innerHTML = '<a href="./music.php?id='+result.id+'">'+result.titre+'</href>';
}
else
  if (table == 'album')
  for (let result of results){
    index = index + 1;
    document.getElementById('result'+index).innerHTML = '<a href="./album.php?id='+result.id+'">'+result.titre+'</href>';
}
else
  for (let result of results){
    index = index + 1;
    document.getElementById('result'+index).innerHTML = '<a href="./artiste.php?id='+result.id+'">'+result.nom+' '+result.prenom+'</href>';
}
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
