<?php
session_start();
include "./db.php";
if($_SESSION['token'] == 0  || $_SESSION['token'] == NULL)
    header('Location: ../php/connection.php?reset=1');
try
{
	$request = 'SELECT token FROM compte';
	$statement = $dbCnx->prepare($request);
	$statement->execute();
	$result = $statement->fetchAll();
}
catch (PDOException $exception)
{
	error_log('Request error: '.$exception->getMessage());
}

foreach ( $result as $ligne) {
	if ($ligne['token'] == $_SESSION['token'] ){
		$connected = 1;
    }
}
if ( $connected != 1)
    header('Location: ../php/connection.php?reset=1');
?>
