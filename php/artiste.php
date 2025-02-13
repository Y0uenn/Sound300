<!DOCTYPE html>
<html>

<head>
<link href="../css/artiste.css" rel="stylesheet" type="text/css"/>
<link href="../css/header_footer.css" rel="stylesheet" type="text/css"/>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>Sound 3000</title>
</head>
<body>
<?php include "../html/header.html";
      include "./PasDeTokenPasDeChocolat.php";

    // Désactiver l'affichage des erreurs
    error_reporting(0);
    ini_set('display_errors', 0);
 

    try
    {
        $request = 'SELECT artiste.*, album.style FROM artiste JOIN discographie ON artiste.id = discographie.id_artiste JOIN album ON discographie.id = album.id WHERE artiste.id ="'.$_GET['id'].'"';
        $statement = $dbCnx->prepare($request);
        $statement->execute();
        $result = $statement->fetchAll();
    }
    catch (PDOException $exception)
    {
        error_log('Request error: '.$exception->getMessage());
    }
    foreach ( $result as $ligne){ 
            $style = $ligne['style'];
    }
    try
    {
        $request = 'SELECT artiste.* FROM artiste WHERE artiste.id ="'.$_GET['id'].'"';
        $statement = $dbCnx->prepare($request);
        $statement->execute();
        $result = $statement->fetchAll();
    }
    catch (PDOException $exception)
    {
        error_log('Request error: '.$exception->getMessage());
    }
    foreach ( $result as $ligne){ 
            $image = $ligne['chemin_image'];
            $pseudo = $ligne['pseudo'];
            $nom = $ligne['nom'];
            $prenom = $ligne['prenom'];
            $type = $ligne['type'];
    }
?>

    <div class="flex">

        <div class="image">
            <img src="<?php echo $image ?>">
        </div>

        <div class="element">
            <h2>
                Name :   <?php echo $nom.' '.$prenom.' "'.$pseudo.'"'?> <br>
                Style : <?php echo $style ?>  <br>
                <?php if($type) echo "en Groupe";
                else echo "Seul"; ?>    <br>
            </h2>
        </div>

    </div>

<?php
    try
    {
        $request = 'SELECT artiste.*,album.id AS album_id, album.chemin_image AS chemin_image_album FROM artiste JOIN discographie ON artiste.id = discographie.id_artiste JOIN album ON discographie.id = album.id WHERE artiste.id ="'.$_GET['id'].'"';
        $statement = $dbCnx->prepare($request);
        $statement->execute();
        $result = $statement->fetchAll();
    }
    catch (PDOException $exception)
    {
        error_log('Request error: '.$exception->getMessage());
    }
        echo '<div class="album">';
        if (count($result) >= 1)
        echo '<h2>Albums :</h2>';
        echo '</div>';
        echo '<section>';
        echo '<div class="artiste-container">';
    foreach ( $result as $ligne){ 
                    echo '<a href="token.php?path=../php/album.php?id='.$ligne['album_id'].'"><img src="'.$ligne['chemin_image_album'].'"></a>';
    }
?>
                </div>
        </section>


        <?php include "../html/footer.html" ?>
    </body>    
</html>