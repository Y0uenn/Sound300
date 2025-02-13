
/*supprime l'effet de recharge de la page d'un lien*/
const suppr_link = document.getElementsByClassName('add-playlist');

console.log(suppr_link);

Array.from(suppr_link).forEach(function(item,i){
    item.addEventListener("click", function(event){
        event.preventDefault();
    })
})


var popupOverlay;
    var newPopupOverlay;

    function openPopup() {


      // Création de la popup overlay
      popupOverlay = document.createElement("div");
      popupOverlay.className = "popup-overlay";
      popupOverlay.onclick = function(event) {
        // Fermeture de la popup lorsque l'utilisateur clique à l'extérieur
        if (event.target === popupOverlay) {
          document.body.removeChild(popupOverlay);
        }
      };

      // Création de la popup
      var popup = document.createElement("div");
      popup.className = "popup";

      // Création des liens
      var lien1 = document.createElement("a");
      lien1.href = "#";
      lien1.textContent = "Playlist 1";
      lien1.onclick = function() {
        // Fermeture de la popup actuelle
        document.body.removeChild(popupOverlay);
        return false;
      };
      popup.appendChild(lien1);

      var lien2 = document.createElement("a");
      lien2.href = "#";
      lien2.textContent = "Playlist 2";
      lien2.onclick = function() {
        // Fermeture de la popup actuelle
        document.body.removeChild(popupOverlay);
        return false;
      };
      popup.appendChild(lien2);

      var lien3 = document.createElement("a");
      lien3.href = "#";
      lien3.textContent = "New Playlist";
      lien3.onclick = function() {
        // Fermeture de la popup actuelle
        document.body.removeChild(popupOverlay);
        // Ouverture de la nouvelle popup
        openNewPopup();
        return false;
      };
      popup.appendChild(lien3);

      // Ajout de la popup à l'overlay
      popupOverlay.appendChild(popup);

      // Ajout de l'overlay au corps de la page
      document.body.appendChild(popupOverlay);
    }

    function openNewPopup() {
      newPopupOverlay = document.createElement("div");
      newPopupOverlay.className = "popup-overlay";
      newPopupOverlay.onclick = function(event) {
        // Fermeture de la popup lorsque l'utilisateur clique à l'extérieur
        if (event.target === newPopupOverlay) {
          document.body.removeChild(newPopupOverlay);
        }
      };

      var newPopup = document.createElement("div");
      newPopup.className = "popup";

      var label = document.createElement("div");
      label.className = "popup-label";
      label.textContent = "New Playlist: title:";
      newPopup.appendChild(label);

      var input = document.createElement("input");
      input.type = "text";
      input.addEventListener("keypress", function(event) {
        if (event.key === "Enter" && input.value.trim() !== "") {
          document.body.removeChild(newPopupOverlay);
        }
      });
      newPopup.appendChild(input);

      newPopupOverlay.appendChild(newPopup);

      document.body.appendChild(newPopupOverlay);
    }