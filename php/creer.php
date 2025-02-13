<!DOCTYPE html>
<html>
    <head>
        <title>page d'inscription</title>
        <meta charset="utf-8">
        <link href="../css/connection.css" rel="stylesheet" type="text/css"/>
        <link href="../css/header_footer.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="../js/compte.js" defer></script>
    </head>

    <body>
        <section id="main">
            <div class="titleBox">
                <h1>Create Account</h1>
            </div>
			
			<form action="./creer.php" method="POST" enctype="multipart/form-data">

            <div class="inputBox">
                <input type="email" id="email" name="email" class="input" required>
                <p class="inputName">E-MAIL</p>
            </div>
			
			<div class="inputBox">
                <input type="text" id="nom" name="nom" class="input" required>
                <p class="inputName">LAST NAME</p>
            </div>
			
			<div class="inputBox">
                <input type="text" id="prenom" name="prenom" class="input" required>
                <p class="inputName">NAME</p>
            </div>
			
			<div class="inputBox">
                <input type="date" id="date_naissance" name="date_naissance" class="input" required>
                <p class="inputName">AGE</p>
            </div>

            <div class="inputBox">
                <input type="password" id="mot_de_passe" name="mot_de_passe" class="input" onkeyup="checkInput()" required>
                <p class="inputName">PASSWORD</p>
            </div>
            <p id="errorMessagePwd"></p>
			
			<div class="inputBox">
                <input type="password" id="mot_de_passe_conf" name="mot_de_passe_conf" class="input" onkeyup="checkInput()" required>
                <p class="inputName">VERIFY PWD</p>
            </div>
            <p id="errorMessagePwdc"></p>
			
			<div class="inputBox">
				<button type="button" id="button" onclick="image_switch()" class="bouton">URL ?</button>
				<p for="image_profil" class="inputName">Profile Picture ?</p>
					<div id="image-button">
					<input type="file" id="image_profil" name="image_profil">
				</div>
				
				
				
			</div>
            

            <button type="submit" class="btn">Account</button>
</form>
            <div class="switchPage">
                <p>vous have a account ?</p>
                <a href="./connection.php">connect</a>
            </div>
        </section>
    </body>
</html>

<?php
// Désactiver l'affichage des erreurs
//error_reporting(0);
//ini_set('display_errors', 0);
ini_set('upload_max_filesize', '5M');
ini_set('post_max_size', '5M');
 
include "./db.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

  $email = htmlspecialchars($_POST['email']);
  $nom = htmlspecialchars($_POST['nom']);
  $prenom = htmlspecialchars($_POST['prenom']);
  $date_naissance = htmlspecialchars($_POST['date_naissance']);
  $mot_de_passe = htmlspecialchars($_POST['mot_de_passe']);
  $mot_de_passe_conf = htmlspecialchars($_POST['mot_de_passe_conf']);
  $image_profil = htmlspecialchars($_POST['image_profil']);

if( isset($_FILES['image_profil']) ) {
	$repo = '../resources/images/compte';
	$leFichierInit = $_FILES['image_profil']['name'];
	$leFichier = $_FILES['image_profil']['tmp_name'];
	$destFichier = $repo.'/'.substr(str_replace(' ', '_', $leFichierInit), 0, strlen($leFichierInit));
	move_uploaded_file( $leFichier,$destFichier );
    if ($destFichier == $repo.'/') $image_profil = NULL;
    else
    $image_profil = $destFichier;
}
  // les hash sont différents à cause du sel
  // ensuite je peux faire une verif en live avec l'evenement quand l'user met son curseur dans la case ou écrit et comparer les mdp en direct
  // je peux aussi ajouter des commentaires sur le pwd écrit (trop petit pas assez complexe etc)

  $bugflag = 0;
  if (strcmp($mot_de_passe,$mot_de_passe_conf)){
	echo '<div class="error">Mot de passe de confirmation faux</div>';
    $bugflag = 1;
    exit;
  }
  $mot_de_passe = password_hash($mot_de_passe,PASSWORD_DEFAULT);
  $mot_de_passe_conf = password_hash($mot_de_passe_conf,PASSWORD_DEFAULT);
  if ( filter_var($email, FILTER_VALIDATE_EMAIL) == false) {
	echo '<div class="error">Adresse mail mal écrite</div>';
    $bugflag = 1;
    exit;
}

  // SECTION POUR VERIFIER QU'IL N'Y AI PAS DE DOUBLON DE PRIMARY KEY
try
{
	$request = 'SELECT email FROM compte';
	$statement = $dbCnx->prepare($request);
	$statement->execute();
	$result = $statement->fetchAll();
}
catch (PDOException $exception)
{
	error_log('Request error: '.$exception->getMessage());
}

foreach ( $result as $ligne) {
	if ($ligne['email'] == $email ){
		$bugflag = 1;
        echo '<div class="error">Adresse mail déjà utilisée</div>';
    }
}

  $mysql_query1 = "INSERT INTO compte (email, nom, prenom, date_naissance, password,chemin_image) VALUES ('".$email."','".$nom."','".$prenom."',STR_TO_DATE('".$date_naissance."', '%Y-%m-%d'),'".$mot_de_passe."','".$image_profil."');";
  
// nettoyage
$query1 = $dbCnx->prepare($mysql_query1);

try {
	//execution
	$query1->execute();
} catch (Exception $e) {
	echo "Une exception a été levée : " . $e->getMessage();
	echo '<div class="error">Adresse mail déjà utilisée</div>';
	$bugflag = 1;
}



if ( $bugflag == 0){
### save
$nomFichier = '../sql/addon.sql';
$mysql_query1 = $mysql_query1."\n";
$file = fopen($nomFichier, 'a');
fwrite($file, $mysql_query1);
fclose($file);
header("Location: ./connection.php");
exit;
}

}
?>
