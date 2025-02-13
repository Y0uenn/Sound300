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


  function dbAddFav($dbCnx,$id = '', $email = '')
  {
    date_default_timezone_set("Europe/Paris");
    try
    {
      $request = 'INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("'.$email.'",'.$id.',STR_TO_DATE("'.date("Y-m-d").'", "%Y-%m-%d"))';
      $statement = $dbCnx->prepare($request);
      $statement->execute();
      $result = $statement->fetchAll(PDO::FETCH_ASSOC);
    }
    catch (PDOException $exception)
    {
      error_log('Request error: '.$exception->getMessage());
      return false;
    }
    // save
    $nomFichier = '../sql/addon.sql';
    $request = $request."\n";
    $file = fopen($nomFichier, 'a');
    fwrite($file, $request);
    fclose($file);

    return $result;
  }

  function dbDeleteFav($dbCnx,$id = '', $email = '')
  {
    try
    {
      $request = 'DELETE FROM ajouter_favoris WHERE id='.$id.' AND email ="'.$email.'"';
      $statement = $dbCnx->prepare($request);
      $statement->execute();
      $result = $statement->fetchAll(PDO::FETCH_ASSOC);
    }
    catch (PDOException $exception)
    {
      error_log('Request error: '.$exception->getMessage());
      return false;
    }
    // save
    $nomFichier = '../sql/addon.sql';
    $request = $request."\n";
    $file = fopen($nomFichier, 'a');
    fwrite($file, $request);
    fclose($file);

    $result = $id;
    return $result;
  }

  // Check the request.
  $requestMethod = $_SERVER['REQUEST_METHOD'];
  $request = substr($_SERVER['PATH_INFO'], 1);
  $request = explode('/', $request);
  $requestRessource = array_shift($request);
  $id = array_shift($request);

  if ($requestRessource == 'results'){
    if ($requestMethod == 'DELETE')
      if(isset($_GET['id']) && isset($_GET['email'])) 
        $data = dbDeleteFav($dbCnx,$_GET['id'], $_GET['email']);
    
    if($requestMethod == 'POST')
      if(isset($_POST['id']) && isset($_POST['email'])) 
        $data = dbAddFav($dbCnx, $_POST['id'], $_POST['email']);
  }

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
