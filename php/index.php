<!DOCTYPE html>
<html>

<head>
<link href="../css/base.css" rel="stylesheet" type="text/css"/>
<link href="../css/header_footer.css" rel="stylesheet" type="text/css"/>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">



<title>Sound 3000</title>
</head>

<body>
<?php include "../html/header.html" ?>
      
<section>
    <div class="container">

        <div class="title"><h1>Hello 


<?php
include "./PasDeTokenPasDeChocolat.php";
    // Désactiver l'affichage des erreurs
    error_reporting(0);
    ini_set('display_errors', 0);
    try
    {
        $request = 'SELECT nom FROM compte WHERE token = "'.$_SESSION['token'].'"';
        $statement = $dbCnx->prepare($request);
        $statement->execute();
        $result = $statement->fetchAll();
    }
    catch (PDOException $exception)
    {
        error_log('Request error: '.$exception->getMessage());
    }
    foreach ( $result as $ligne) 
	        echo $ligne['nom'];

?>
        </h1></div>

        <div class="title"><h1>History</h1></div>
		<div class="music-container">

<?php
            try // on récup d'abord l'email
            {
                $request = 'SELECT email FROM compte WHERE token ="'.$_SESSION['token'].'"';
                $statement = $dbCnx->prepare($request);
                $statement->execute();
                $result = $statement->fetchAll();
            }
            catch (PDOException $exception)
            {
                error_log('Request error: '.$exception->getMessage());
            }
            foreach ( $result as $ligne){ 
                $emailToken = $ligne['email'];
            }
$statement = $dbCnx->prepare($request);
$statement->execute();
$result = $statement->fetchAll();
?>
        <?php
    try
    {
        $request = 'SELECT * FROM ecoute WHERE email ="'.$emailToken.'" ORDER BY date_ecoute DESC';
        $statement = $dbCnx->prepare($request);
        $statement->execute();
        $result = $statement->fetchAll();
    }
    catch (PDOException $exception)
    {
        error_log('Request error: '.$exception->getMessage());
    }
    foreach ( $result as $ligne){ 
        $idSon = $ligne['id'];
                        try
                        {
                            $request = 'SELECT * FROM morceau WHERE id ='.$idSon;
                            $statement = $dbCnx->prepare($request);
                            $statement->execute();
                            $result = $statement->fetchAll();
                        }
                        catch (PDOException $exception)
                        {
                            error_log('Request error: '.$exception->getMessage());
                        }
                        foreach ( $result as $ligneAlt){ 
                            $musique = $ligneAlt['chemin_image'];
			echo '<a href="music.php?id='.$idSon.'"><img src="'.$musique.'"></a>';
    }
}
        ?>

		</div>
    </div>
</section>
<section>
    <div class="container">
        <div class="title"><h1>Favorites</h1></div>
		<div class="music-container">


        <?php
    try
    {
        $request = 'SELECT * FROM ajouter_favoris WHERE email ="'.$emailToken.'" ORDER BY date_ajout DESC';
        $statement = $dbCnx->prepare($request);
        $statement->execute();
        $result = $statement->fetchAll();
    }
    catch (PDOException $exception)
    {
        error_log('Request error: '.$exception->getMessage());
    }
    foreach ( $result as $ligne){ 
        $idSon = $ligne['id'];
                        try
                        {
                            $request = 'SELECT * FROM morceau WHERE id ='.$idSon;
                            $statement = $dbCnx->prepare($request);
                            $statement->execute();
                            $result = $statement->fetchAll();
                        }
                        catch (PDOException $exception)
                        {
                            error_log('Request error: '.$exception->getMessage());
                        }
                        foreach ( $result as $ligneAlt){ 
                            $musique = $ligneAlt['chemin_image'];
			echo '<a href="music.php?id='.$idSon.'"><img src="'.$musique.'"></a>';
    }
}

        ?>


		</div>
    </div>
</section>



<?php include "../html/footer.html" ?>
</body>
