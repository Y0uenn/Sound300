#!/bin/bash
# Old updating script in order to keep different constants.php than github ones
# Ce script est là à titre d'outil, il ignore les différences entre constants.php local et distant lors des pull et push (en principe)
cat ./.chat
git -C /var/www/html/sound3000/ config pull.rebase false # pour adopter le comportement de merge
git -C /var/www/html/sound3000/ stash save "Nom_de_la_sauvegarde"
git -C /var/www/html/sound3000/ pull origin main
git -C /var/www/html/sound3000/ stash pop
