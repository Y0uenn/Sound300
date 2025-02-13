'use strict';
let URL = 1;

function image_switch(){

    let bouton = document.getElementById('button');
    let image = document.getElementById('image-button');
    if(URL == 0){
        bouton.innerHTML = "Local file ?";
        URL = 1;
		    image.innerHTML = '<input type="url" id="file" name="file"><br><br></br>';
    }
    else {
        bouton.innerHTML = "URL ?";
        URL = 0;
		    image.innerHTML = '<input type="file" id="file" name="file"><br></br>';
    }
}