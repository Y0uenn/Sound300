<!DOCTYPE html>
<html>

<head>
<link href="../css/album.css" rel="stylesheet" type="text/css"/>
<link href="../css/header_footer.css" rel="stylesheet" type="text/css"/>
<link href="../css/pop-up.css" rel="stylesheet" type="text/css"/>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Sound 3000</title>
<script src="../js/heart.js" defer></script>
<script src="../js/ajax_favorites.js" defer></script>
</head>
<body>
<?php include "../html/header.html"; 
      include "./PasDeTokenPasDeChocolat.php";

    // Désactiver l'affichage des erreurs
    error_reporting(0);
    ini_set('display_errors', 0);
 

    try
    {
        $request = 'SELECT album.*, artiste.pseudo, artiste.id AS artiste_id  FROM album JOIN discographie ON album.id = discographie.id JOIN artiste ON discographie.id_artiste = artiste.id WHERE album.id ="'.$_GET['id'].'"';
        $statement = $dbCnx->prepare($request);
        $statement->execute();
        $result = $statement->fetchAll();
    }
    catch (PDOException $exception)
    {
        error_log('Request error: '.$exception->getMessage());
    }
    foreach ( $result as $ligne){ 
	        $titreGet = $ligne['titre'];
            $image = $ligne['chemin_image'];
            $date = $ligne['date_parution'];
            $pseudo = $ligne['pseudo'];
            $style = $ligne['style'];
    }
?>

    <div class="flex">

        <div class="image">
            <img src="<?php echo $image ?>">
        </div>

        <div class="element">                
            <?php echo $titreGet ?>          <br>
            <?php echo '<a href="token.php?path=../php/artiste.php?id='.$ligne['artiste_id'].'">'.$pseudo.'</a>'?>         <br>
            <?php echo $date ?>          <br>
            <?php echo $style ?>          <br>
        
        </div>
    
        <!-- <div class="music"><h2>music : </h2></div>  -->
        <div class="all-music">
        <ol class="list-card-music">   

        <?php
        $inc = 0;
    try
    {
        $request = 'SELECT * FROM morceau WHERE id_album ='.$_GET['id'];
        $statement = $dbCnx->prepare($request);
        $statement->execute();
        $result = $statement->fetchAll();
    }
    catch (PDOException $exception)
    {
        error_log('Request error: '.$exception->getMessage());
    }
    foreach ( $result as $ligne){ 
        $inc = $inc + 1;
        $musique = $ligne['chemin_musique'];
        $idSon = $ligne['id'];
        $titreSon = $ligne['titre'];
        $cheminImg = $ligne['chemin_image'];
        $dureeSon = $ligne['duree'];
        //<!-- un morceau : -->
            echo '<li>';
                echo '<div class="card-music">';
                    echo '<div class="card-music-description">';
                        echo '<div class="card-music-description--cover">';
                            echo '<img src="'.$ligne['chemin_image'].'">';
                        echo '</div>';
                        echo '<div class="card-music-description--title--artiste">';
                            echo '<h3><a href="./music.php?id='.$idSon.'">'.$ligne['titre'].'</a></h3>';
                            echo '<h4>'.floor($ligne['duree']/60).':'.($ligne['duree']%60).'</h4>';
                        echo '</div>';
                    echo '</div>';
                    echo '<div class="card-music-actions">';
                        echo '<ul>'; // On aura l'ID du morceau en parentChild du coeur cliqué
                            echo '<li><a href="" class="add-playlist"><img src="../html/image/add.png" onclick="openPopup()"></a></li>';

                            // SECTION FAVORIS --------------
                            $maybeAdded = '';
                                try // on va récuperer la liste des favoris existants pour l'utilisateur connecté afin de mettre en place les coeurs
                                {
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
                                    if($ligne['id'] == $idSon) $maybeAdded = ' added';
                                }
                            echo '<li><a id="keur" href="" class="add-favorite '.$idSon.$maybeAdded.' '.$emailToken.'"></a></li>';
                            // $maybeAdded sera soit "" soit " added" en fonction de si le morceau est dans la base favoris ou non 
                            // ------------------------------

                            echo '<li><a href="'.$musique.'//'.$titreSon.'//'.$cheminImg.'//'.$pseudo.'//'.$dureeSon.'//'.$emailToken.'//'.$idSon.'" class="playkk'.$inc.' countPlay" id="playykk'.$inc.'"><img src="../html/image/play.png"></a></li>';
                        echo '</ul>';
                    echo '</div>';
                echo '</div>';
            echo '</li>';
    }
        //<!-- /un morceau : -->
        ?>


        </ol>
        </div>
    </div>

    <section>
        <div class="sound">
        </div>
</section>

        <?php include "../html/footer.html" ?>
        <script src="../js/pop-up.js" defer></script>
        <script src="../js/play.js" defer></script>

    </body>    
</html>