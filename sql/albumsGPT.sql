# Ici la requête GPT :
# INSERT INTO album (id, titre, date_parution, chemin_image, style) VALUES ($ID,'$TITRE',STR_TO_DATE('$DATE_PARUTION', '%d/%m/%Y'),'$CHEMIN_IMAGE','$STYLE'); Complète cette requête avec des albums des artistes que tu m'as donné précedemment, je veux deux albums par artiste. Dans $ID génère un nombre aléatoire, dans $TITRE met le titre, dans $DATE_PARUTION met une date au format : DD/MM/YYYY, dans chemin image met : "../resources/images/album/nom_album.png et remplace nom_album.png par le nom de l'album et dans $STYLE tu dois choisir un de ces styles avec l'écriture exacte, prend en un au hasard à chaque album : "classic,hardcore,new genre,pop,rap,rock,underground"
# #--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#---
#+#--#--#--#--#--#---+
#| style       |
#+#--#--#--#--#--#---+
#| classic     |
#| hardcore    |
#| new genre   |
#| pop         |
#| rap         |
#| rock        |
#| underground |
#+#--#--#--#--#--#---+

use bddSound;
ALTER TABLE album MODIFY COLUMN chemin_image VARCHAR(400);

#-- Albums pour Taylor Swift
INSERT INTO album (id, titre, date_parution, chemin_image, style)
VALUES (1, 'Fearless', STR_TO_DATE('11/11/2008', '%d/%m/%Y'), '../resources/images/album/fearless.png', 'hardcore');

INSERT INTO album (id, titre, date_parution, chemin_image, style)
VALUES (2, 'Red', STR_TO_DATE('22/10/2012', '%d/%m/%Y'), '../resources/images/album/red.png', 'pop');

#-- Albums pour Ed Sheeran
INSERT INTO album (id, titre, date_parution, chemin_image, style)
VALUES (3, '÷', STR_TO_DATE('03/03/2017', '%d/%m/%Y'), '../resources/images/album/divide.png', 'pop');

INSERT INTO album (id, titre, date_parution, chemin_image, style)
VALUES (4, 'No.6 Collaborations Project', STR_TO_DATE('12/07/2019', '%d/%m/%Y'), '../resources/images/album/no_6_collaborations_project.png', 'pop');


#-- Albums pour Ariana Grande
INSERT INTO album (id, titre, date_parution, chemin_image, style)
VALUES (7, 'Sweetener', STR_TO_DATE('17/08/2018', '%d/%m/%Y'), '../resources/images/album/sweetener.png', 'pop');

INSERT INTO album (id, titre, date_parution, chemin_image, style)
VALUES (8, 'Positions', STR_TO_DATE('30/10/2020', '%d/%m/%Y'), '../resources/images/album/positions.png', 'pop');

# -- Dua lipa
INSERT INTO album (id, titre, date_parution, chemin_image, style)
VALUES (14, 'Futur Nostalgia', STR_TO_DATE('04/03/2011', '%d/%m/%Y'), '../resources/images/album/futur_nostalgia.png', 'classic');

# -- Taylor Swift
INSERT INTO album (id, titre, date_parution, chemin_image, style)
VALUES (15, 'Reputation', STR_TO_DATE('10/01/2009', '%d/%m/%Y'), '../resources/images/album/reputation.png', 'rock');

# a creer :
#-- Albums pour BTS
INSERT INTO album (id, titre, date_parution, chemin_image, style)
VALUES (5, 'Map of the Soul: 7', STR_TO_DATE('21/02/2020', '%d/%m/%Y'), '../resources/images/album/map_of_the_soul_7.png', 'pop');

INSERT INTO album (id, titre, date_parution, chemin_image, style)
VALUES (6, 'Butter', STR_TO_DATE('21/05/2021', '%d/%m/%Y'), '../resources/images/album/butter.png', 'pop');

#-- Albums pour Drake
INSERT INTO album (id, titre, date_parution, chemin_image, style)
VALUES (9, 'Scorpion', STR_TO_DATE('29/06/2018', '%d/%m/%Y'), '../resources/images/album/scorpion.png', 'rap');

INSERT INTO album (id, titre, date_parution, chemin_image, style)
VALUES (10, 'Certified Lover Boy', STR_TO_DATE('03/09/2021', '%d/%m/%Y'), '../resources/images/album/certified_lover_boy.png', 'rap');

#-- Albums pour Billie Eilish
INSERT INTO album (id, titre, date_parution, chemin_image, style)
VALUES (11, 'When We All Fall Asleep, Where Do We Go?', STR_TO_DATE('29/03/2019', '%d/%m/%Y'), '../resources/images/album/when_we_all_fall_asleep.png', 'pop');

INSERT INTO album (id, titre, date_parution, chemin_image, style)
VALUES (12, 'Happier Than Ever', STR_TO_DATE('30/07/2021', '%d/%m/%Y'), '../resources/images/album/happier_than_ever.png', 'pop');

# -- Justin Bieber
INSERT INTO album (id, titre, date_parution, chemin_image, style)
VALUES (13, 'Justice', STR_TO_DATE('30/09/2001', '%d/%m/%Y'), '../resources/images/album/justice.png', 'new genre');
