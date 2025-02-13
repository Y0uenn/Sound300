<?php
/**
 * php/request.php/tweets/ Récupération des tweets
 * php/request.php/tweets/?login=... Récupération des tweets d’un user
 * php/request.php/tweets/ login=...&text=... Ajout d’un tweet
 * php/request.php/tweets/i login=...&text=... Modification du tweet
 * php/request.php/tweets/i?login=... Suppression du tweet
 * 
 * 
 * $requestMethod = $_SERVER['REQUEST_METHOD'];
 * $request = $_SERVER['PATH_INFO'];
 * $request = explode('/', $request);
 */

  include "./PasDeTokenPasDeChocolat.php";
  if (!$dbCnx)
  {
    header('HTTP/1.1 503 Service Unavailable');
    exit;
  }


  function dbRequest($dbCnx,$table = '', $input = '')
  {
    try
    {
      if($table == 'artiste')
      $request = 'SELECT * FROM '.$table.' WHERE nom COLLATE UTF8_GENERAL_CI LIKE \''.$input.'%\' OR prenom COLLATE UTF8_GENERAL_CI LIKE \''.$input.'%\' OR pseudo COLLATE UTF8_GENERAL_CI LIKE \''.$input.'%\'';
      else
      $request = 'SELECT * FROM '.$table.' WHERE titre COLLATE UTF8_GENERAL_CI LIKE \''.$input.'%\'';
      $statement = $dbCnx->prepare($request);
      if ($table != '')
      $statement->execute();
      $result = $statement->fetchAll(PDO::FETCH_ASSOC);
    }
    catch (PDOException $exception)
    {
      error_log('Request error: '.$exception->getMessage());
      return false;
    }
    return $result;
  }


  // Check the request.
  $requestMethod = $_SERVER['REQUEST_METHOD'];
  $request = substr($_SERVER['PATH_INFO'], 1);
  $request = explode('/', $request);
  $requestRessource = array_shift($request);
  $id = array_shift($request);
  // Polls request.
  // function dbDeleteTweet($db, $id, $login)
  // function dbModifyTweet($db, $id, $login, $text)
  // function dbAddTweet($db, $login, $text)
  // function dbRequestTweets($db, $login = '')
  if ($requestRessource == 'results')
    if($requestMethod == 'GET')
      if(isset($_GET['table']) && isset($_GET['input']))
        $data = dbRequest($dbCnx,$_GET['table'], $_GET['input']);

 // [{"id":"1","text":"Un premier tweet !!","login":"cir2"},{"id":"2","text":"Un second tweet !!","login":"cir3"}]

  // Send data to the client.
  header('Content-Type: application/json; charset=utf-8');
  header('Cache-control: no-store, no-cache, must-revalidate');
  header('Pragma: no-cache');
  if ($data !== false)
  {
    if($requestMethod == 'POST'){
    header('HTTP/1.1 201 OK');
    } else
    header('HTTP/1.1 200 OK');
    echo json_encode($data);
  }
  else
    header('HTTP/1.1 400 Bad Request');
  exit;
?>
