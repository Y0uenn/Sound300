<!DOCTYPE html>
<html>
    <head>
        <title>Connection</title>
        <meta charset="utf-8">
        <link href="../css/connection.css" rel="stylesheet" type="text/css"/>
        <link href="../css/header_footer.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>

    <body>
        <section id="main">
            <div class="titleBox">
                <h1>Connection to</h1>
                <h2>Sound 3000</h2>
            </div>

			<form action="./connection.php" method="POST">
            <div class="inputBox">
                <input type="email" id="email" name="email" class="input" required>
                <p class="inputName">E-MAIL</p>
            </div>

            <div class="inputBox">
                <input type="password" id="mot_de_passe" name="mot_de_passe" class="input" required>
                <p class="inputName">PASSWORD</p>
            </div>

            <button type="submit" class="btn">Connect</button>
</form>

            <div class="switchPage">
                <p>You don't have account ?</p>
                <a href="./creer.php">sign up</a>
            </div>
        </section>
    </body>
</html>

<?php
// Désactiver l'affichage des erreurs
error_reporting(0);
ini_set('display_errors', 0);
session_start();
 
include "./db.php";

if ($_GET['reset'] == 1){
    try
    {
        $request = 'SELECT email FROM compte WHERE token = "'.$_SESSION['token'].'"';
        $statement = $dbCnx->prepare($request);
        $statement->execute();
        $result = $statement->fetchAll();
    }
    catch (PDOException $exception)
    {
        error_log('Request error: '.$exception->getMessage());
    }
    foreach ( $result as $ligne) 
        $email = $ligne['email'];
    try
    {
        $request = 'DELETE FROM ecoute WHERE email="'.$email.'"';
        $statement = $dbCnx->prepare($request);
        $statement->execute();
    }
    catch (PDOException $exception)
    {
        error_log('Request error: '.$exception->getMessage());
    }
    $_SESSION['token']=0;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = htmlspecialchars($_POST['email']);
    $password = htmlspecialchars($_POST['mot_de_passe']);

    try
    {
        $request = 'SELECT password FROM compte WHERE email = "'.$email.'"';
        $statement = $dbCnx->prepare($request);
        $statement->execute();
        $result = $statement->fetchAll();
    }
    catch (PDOException $exception)
    {
        error_log('Request error: '.$exception->getMessage());
    }
    foreach ( $result as $ligne) {
	    if (password_verify($password,$ligne['password'])){


            // mdp valide
            $token = genererToken($ligne['password']);

            // Stockage du token dans la session ou dans une base de données associée à l'utilisateur
            $_SESSION['token'] = $token;

    try
    {
        $request = 'UPDATE compte SET token = "'.$token.'" WHERE email = "'.$email.'"';
        $statement = $dbCnx->prepare($request);
        $statement->execute();
    }
    catch (PDOException $exception)
    {
        error_log('Request error: '.$exception->getMessage());
    }
    try
    {
        $request = 'UPDATE compte SET timestamp = "'.time().'" WHERE email = "'.$email.'"';
        $statement = $dbCnx->prepare($request);
        $statement->execute();
    }
    catch (PDOException $exception)
    {
        error_log('Request error: '.$exception->getMessage());
    }
        
            // Redirection vers la page protégée
            header('Location: ../php/token.php?path=../php/index.php');
        }
        else {
            // mdp invalide
            echo "Mauvais identifiants !";
        }
    }
}


function genererToken($passwordhash){
    return hash("sha256",$passwordhash);
}

?>