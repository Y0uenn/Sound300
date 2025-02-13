<!DOCTYPE html>
<html>

<head>
<link href="../css/history.css" rel="stylesheet" type="text/css"/>
<link href="../css/header_footer.css" rel="stylesheet" type="text/css"/>
<link href="../css/pop-up.css" rel="stylesheet" type="text/css"/>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">



<title>Sound 3000</title>
<script src="../js/heart.js" defer></script>
<script src="../js/ajax_favorites.js" defer></script>
</head>

<body>

<!-- ####################################################### -->


<?php

    include "../html/header.html"; 
      include "./PasDeTokenPasDeChocolat.php";

    // Désactiver l'affichage des erreurs
    error_reporting(0);
    ini_set('display_errors', 0);
    ?>

<ol class="list-card-music">

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
?>
        <?php
        $inc = 0;
    try
    {
        $request = 'SELECT * FROM ajouter_favoris WHERE email ="'.$emailToken.'"';
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
                        $inc = $inc + 1;
                            $musique = $ligneAlt['chemin_musique'];
        //<!-- un morceau : -->
            echo '<li id="'.$idSon.'">';
                echo '<div class="card-music">';
                    echo '<div class="card-music-description">';
                        echo '<div class="card-music-description--cover">';
                            echo '<img src="'.$ligneAlt['chemin_image'].'">';
                        echo '</div>';
                        echo '<div class="card-music-description--title--artiste">';
                            echo '<h3><a href="./music.php?id='.$idSon.'">'.$ligneAlt['titre'].'</a></h3>';
                            echo '<h4>'.floor($ligneAlt['duree']/60).':'.($ligneAlt['duree']%60).'</h4>';
                        echo '</div>';
                    echo '</div>';
                    echo '<div class="card-music-actions">';
                        echo '<ul>'; // On aura l'ID du morceau en parentChild du coeur cliqué
                            echo '<li><a href="" class="add-playlist" onclick="openPopup()"><img src="../html/image/add.png"></a></li>';

                            // SECTION FAVORIS --------------
                            echo '<li><a id="keur" href="" class="add-favorite '.$idSon.' added '.$emailToken.'"></a></li>';
                            // $maybeAdded sera soit "" soit " added" en fonction de si le morceau est dans la base favoris ou non 
                            // ------------------------------

                            echo '<li><a href="'.$musique.'//'.' '.'//'.$ligneAlt['chemin_image'].'//'.$ligneAlt['titre'].'//'.$ligneAlt['duree'].'//'.$emailToken.'//'.$idSon.'" class="playkk'.$inc.' countPlay" id="playykk'.$inc.'"><img src="../html/image/play.png"></a></li>';
                        echo '</ul>';
                    echo '</div>';
                echo '</div>';
            echo '</li>';
    }
}
        //<!-- /un morceau : -->
        ?>
</ol>

<?php include "../html/footer.html" ?>
<script src="../js/pop-up.js" defer></script>
<script src="../js/play.js" defer></script>
</body>
