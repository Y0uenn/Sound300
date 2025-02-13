# La requête chatGPT en question
# Donne moi une liste de 100 top artistes de 2022 sous forme de commandes sql pour remplir ma table, je vais te dire comment me les donner. Chaque artiste est entré avec cette commande : INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance,sexe,type,id_groupe,chemin_image) VALUES ($ID,'$NOM','$PRENOM','$PSEUDO',STR_TO_DATE('$DATE_NAISSANCE', '%d/%m/%Y'),$SEXE,$TYPE,$IDGROUPE,$URL_IMAGE);, Si l'artiste est dans un groupe ou +, $TYPE est à 1, sinon 0, si l'artiste est un homme $SEXE est à 1, sinon 0 et ensuite rempli les variables avec les vraies infos du chanteur. $DATE_NAISSANCE est de la forme DD/MM/YYYY. Je veux 100 commandes SQL pour 100 artistes. Je ne veux pas des artistes où tu n'as pas d'information. Laisse $IDGROUPE à NULL. Et dans $URL_IMAGE, met ../resources/images/artiste/nom_de_lartiste.png et dans nom_de_lartiste.png entre le nom de l'artiste.
# ----------------------------------------------------------------------------------------------------------------------------------

use bddSound;

INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance, sexe, type, id_groupe, chemin_image) VALUES (1000, 'Taylor', 'Swift', 'TayTay', STR_TO_DATE('13/12/1989', '%d/%m/%Y'), 0, 0, NULL, '../resources/images/artiste/taylor_swift.png');

INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance, sexe, type, id_groupe, chemin_image) VALUES (2, 'Ed', 'Sheeran', 'Ed', STR_TO_DATE('17/02/1991', '%d/%m/%Y'), 1, 0, NULL, '../resources/images/artiste/ed_sheeran.png');

INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance, sexe, type, id_groupe, chemin_image) VALUES (4, 'Ariana', 'Grande', 'Ari', STR_TO_DATE('26/06/1993', '%d/%m/%Y'), 0, 0, NULL, '../resources/images/artiste/ariana_grande.png');


INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance, sexe, type, id_groupe, chemin_image) VALUES (99, 'Jason', 'Derulo', NULL, STR_TO_DATE('21/09/1989', '%d/%m/%Y'), 1, 0, NULL, '../resources/images/artiste/jason_derulo.png');

INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance, sexe, type, id_groupe, chemin_image)
VALUES (101, 'Lana', 'Del Rey', 'Lana', STR_TO_DATE('21/06/1985', '%d/%m/%Y'), 0, 0, NULL, '../resources/images/artiste/lana_del_rey.png');

INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance, sexe, type, id_groupe, chemin_image)
VALUES (103, 'Elton', 'John', NULL, STR_TO_DATE('25/03/1947', '%d/%m/%Y'), 1, 0, NULL, '../resources/images/artiste/elton_john.png');

INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance, sexe, type, id_groupe, chemin_image)
VALUES (199, 'Post', 'Malone', 'Post', STR_TO_DATE('04/07/1995', '%d/%m/%Y'), 1, 0, NULL, '../resources/images/artiste/post_malone.png');

INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance, sexe, type, id_groupe, chemin_image)
VALUES (202, 'Camila', 'Cabello', 'Camila', STR_TO_DATE('03/03/1997', '%d/%m/%Y'), 0, 0, NULL, '../resources/images/artiste/camila_cabello.png');

INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance, sexe, type, id_groupe, chemin_image)
VALUES (299, 'Megan', 'Thee Stallion', 'Stallion', STR_TO_DATE('15/02/1995', '%d/%m/%Y'), 0, 0, NULL, '../resources/images/artiste/megan_thee_stallion.png');

INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance, sexe, type, id_groupe, chemin_image)
VALUES (300, 'Enrique', 'Iglesias', 'El Tacos', STR_TO_DATE('08/05/1975', '%d/%m/%Y'), 1, 0, NULL, '../resources/images/artiste/enrique_iglesias.png');

INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance, sexe, type, id_groupe, chemin_image)
VALUES (302, 'Travis', 'Scott', 'Travis', STR_TO_DATE('30/04/1992', '%d/%m/%Y'), 1, 0, NULL, '../resources/images/artiste/travis_scott.png');

INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance, sexe, type, id_groupe, chemin_image)
VALUES (303, 'Dua', 'Lipa', 'Dudu', STR_TO_DATE('22/08/1995', '%d/%m/%Y'), 0, 0, NULL, '../resources/images/artiste/dua_lipa.png');


INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance, sexe, type, id_groupe, chemin_image)
VALUES (399, 'Lil', 'Nas X', 'Petit Nas Ixe', STR_TO_DATE('09/04/1999', '%d/%m/%Y'), 1, 0, NULL, '../resources/images/artiste/lil_nas_x.png');


