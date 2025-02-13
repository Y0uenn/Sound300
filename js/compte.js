'use strict';
let URL = 0;

function image_switch(){

    let bouton = document.getElementById('button');
    let image = document.getElementById('image-button');
    if(URL == 0){
        bouton.innerHTML = "Local file ?";
        URL = 1;
		    image.innerHTML = '<input type="url" id="image_profil" name="image_profil"><br><br></br>';
    }
    else {
        bouton.innerHTML = "URL ?";
        URL = 0;
		    image.innerHTML = '<input type="file" id="image_profil" name="image_profil"><br></br>';
    }
}


    var input = document.getElementById("mot_de_passe");
    var inputConf = document.getElementById("mot_de_passe_conf");

function checkInput() {
    checkPasswordStrength();
    if(input.value!=inputConf.value){
      document.getElementById('errorMessagePwdc').innerHTML =  "Mots de passe différents";
    }
    else{
      document.getElementById('errorMessagePwdc').innerHTML =  "";
    }
  }



  function checkPasswordStrength() {
    // les regex ont été faites par chatGPT
    var password = input.value;
    
    // Réglages :
    var minLength = 8; 
    var minUpperCase = 1; 
    var minLowerCase = 1;  
    var minDigits = 1;  
    var minSpecialChars = 1; 
    
    // Vérifier la longueur du mot de passe
    if (password.length < minLength) {
      document.getElementById('errorMessagePwd').innerHTML =  "Le mot de passe est trop court.";
      return;
    }
    
    // Vérifier les lettres majuscules
    var upperCaseRegex = /[A-Z]/g;
    if (!password.match(upperCaseRegex) || password.match(upperCaseRegex).length < minUpperCase) {
      document.getElementById('errorMessagePwd').innerHTML =  "Le mot de passe doit contenir au moins " + minUpperCase + " lettre(s) majuscule(s).";
      return;
    }
    
    // Vérifier les lettres minuscules
    var lowerCaseRegex = /[a-z]/g;
    if (!password.match(lowerCaseRegex) || password.match(lowerCaseRegex).length < minLowerCase) {
      document.getElementById('errorMessagePwd').innerHTML =  "Le mot de passe doit contenir au moins " + minLowerCase + " lettre(s) minuscule(s).";
      return;
    }
    
    // Vérifier les chiffres
    var digitsRegex = /[0-9]/g;
    if (!password.match(digitsRegex) || password.match(digitsRegex).length < minDigits) {
      document.getElementById('errorMessagePwd').innerHTML =  "Le mot de passe doit contenir au moins " + minDigits + " chiffre(s).";
      return;
    }
    
    // Vérifier les caractères spéciaux
    var specialCharsRegex = /[!@#$%^&*]/g;
    if (!password.match(specialCharsRegex) || password.match(specialCharsRegex).length < minSpecialChars) {
      document.getElementById('errorMessagePwd').innerHTML =  "Le mot de passe doit contenir au moins " + minSpecialChars + " caractère(s) spécial(aux).";
      return;
    }
  }
