<?php
// Démarre la session
session_start();
include "./db.php";
// Vérifie si l'utilisateur est déjà authentifié avec un token valide
if (isset($_SESSION['token']) && verifyToken($_SESSION['token'])) {

    // on réinitialise son timestamp
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

    // Utilisateur déjà connecté, peut accéder au contenu protégé
    header('Location: '.$_GET['path']);
    exit;
} else {
    $_SESSION['token']=0;
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
    header('Location: connection.php');
    exit;
}

// Fonction pour vérifier la validité du token
function verifyToken($token) {
include "./db.php";
    try
    {
        $request = 'SELECT timestamp FROM compte WHERE token = "'.$_SESSION['token'].'"';
        $statement = $dbCnx->prepare($request);
        $statement->execute();
        $result = $statement->fetchAll();
    }
    catch (PDOException $exception)
    {
        error_log('Request error: '.$exception->getMessage());
    }
    foreach ( $result as $ligne) 
	        $hashTS = $ligne['timestamp'];
    // Vérifie si le token est valide selon vos critères (par exemple, en le comparant à une valeur stockée en base de données)
    // Retourne true si le token est valide, sinon false
    return (time()-$hashTS < 300);
}
?>