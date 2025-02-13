/*###########################################################*/ 

    let searchBtn = document.getElementById("searchBtn");
    searchBtn.addEventListener("click", function(event){
      event.preventDefault(); 
      document.getElementById("searchWrapper").classList.toggle("open");  
    });
  

/*###########################################################*/ 
  
  const buttons = document.getElementsByClassName('toggle-button');
  const defaultButton = document.getElementById('button1');
  
  defaultButton.classList.add('active');
  
  for (let i = 0; i < buttons.length; i++) {
    buttons[i].addEventListener('click', function() {
      for (let j = 0; j < buttons.length; j++) {
        buttons[j].classList.remove('active');
      }
      this.classList.add('active');
    });
  }


/*###########################################################*/ 

  
    // Récupérer le champ de saisie et les boutons
  var input2 = document.getElementById('input_search');
  var bouton1 = document.getElementById('result1');
  var bouton2 = document.getElementById('result2');
  var bouton3 = document.getElementById('result3');
  var bouton4 = document.getElementById('result4');
  var bouton5 = document.getElementById('result5');
  var bouton6 = document.getElementById('result6');
  
  // Ajouter un écouteur d'événement sur l'input
  input2.addEventListener('input', function() {
    if (input2.value !== '') {
      // Afficher ou masquer les boutons en fonction de la valeur
      if (nb_result >= 1) {
          bouton1.style.display = 'block';
      } else {
          bouton1.style.display = 'none';
      }
      
      if (nb_result >= 2) {
          bouton2.style.display = 'block';
      } else {
          bouton2.style.display = 'none';
      }
      
      if (nb_result >= 3) {
          bouton3.style.display = 'block';
      } else {
          bouton3.style.display = 'none';
      }
  
      if (nb_result >= 4) {
          bouton4.style.display = 'block';
      } else {
          bouton4.style.display = 'none';
      }
  
      if (nb_result >= 5) {
          bouton5.style.display = 'block';
      } else {
          bouton5.style.display = 'none';
      }
  
      if (nb_result >= 6) {
          bouton6.style.display = 'block';
      } else {
          bouton6.style.display = 'none';
      }
    }

    if (input2.value == '') {
        bouton1.style.display = 'none';
        bouton2.style.display = 'none';
        bouton3.style.display = 'none';
        bouton4.style.display = 'none';
        bouton5.style.display = 'none';
        bouton6.style.display = 'none';
    }
  });








