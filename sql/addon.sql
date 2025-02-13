USE bddSound;
INSERT INTO styles (style) VALUES ('rap');
INSERT INTO styles (style) VALUES ('rock');
INSERT INTO styles (style) VALUES ('pop');
INSERT INTO styles (style) VALUES ('classic');
INSERT INTO styles (style) VALUES ('hardcore');
INSERT INTO styles (style) VALUES ('underground');
INSERT INTO styles (style) VALUES ('new genre');
USE bddSound; INSERT INTO album (id, titre, date_parution, chemin_image, style) VALUES (1,'Vivre à la campagne',STR_TO_DATE('01/01/2010', '%d/%m/%Y'),'url','classic');
USE bddSound; INSERT INTO album (id, titre, date_parution, chemin_image, style) VALUES (2,'Fréquence sonore',STR_TO_DATE('05/06/2020', '%d/%m/%Y'),'url.com','hardcore');
USE bddSound; INSERT INTO album (id, titre, date_parution, chemin_image, style) VALUES (3,'Raise & Revolt',STR_TO_DATE('03/08/2009', '%d/%m/%Y'),'url.com','hardcore');
INSERT INTO types(type) VALUES(TRUE);
INSERT INTO types(type) VALUES(FALSE);
USE bddSound; INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance,sexe,type,id_groupe) VALUES (1,'Costes','Jean','Costes',STR_TO_DATE('04/03/1968', '%d/%m/%Y'),1,0,NULL);
INSERT INTO compte (email, nom, prenom, date_naissance, password,chemin_image) VALUES ('bb@bb.bb','Nom','Prenom',STR_TO_DATE('2555-02-05', '%Y-%m-%d'),'$2y$10$BYrHmA7o1uCZ5oMY6Y21FuDniHSNw/SrspHx8TN9/nat59w3.UFqa','../resources/images/compte/neon.jpg');
INSERT INTO compte (email, nom, prenom, date_naissance, password,chemin_image) VALUES ('woup@woup.woup','lkjf','lfj',STR_TO_DATE('0161-12-04', '%Y-%m-%d'),'$2y$10$lB0PVbh8HoJRCR5Op5hYw.2E3GxjjMSRyi.L06pCHLb30xVdXJU02','../resources/images/compte/');
INSERT INTO compte (email, nom, prenom, date_naissance, password,chemin_image) VALUES ('testa@jk.fr','wou','jmlkq',STR_TO_DATE('0056-04-08', '%Y-%m-%d'),'$2y$10$RAa4ec68pFO7tw6cfDR2JuQpEjyI2soKK3/UCSdkNq/MHQhSjDG5u','');
USE bddSound; INSERT INTO discographie (id, id_artiste) VALUES (1,1000);
USE bddSound; INSERT INTO discographie (id, id_artiste) VALUES (2,1000);
USE bddSound; INSERT INTO discographie (id, id_artiste) VALUES (3,2);
USE bddSound; INSERT INTO discographie (id, id_artiste) VALUES (4,2);
USE bddSound; INSERT INTO discographie (id, id_artiste) VALUES (7,4);
USE bddSound; INSERT INTO discographie (id, id_artiste) VALUES (8,4);
USE bddSound; INSERT INTO discographie (id, id_artiste) VALUES (14,303);
USE bddSound; INSERT INTO discographie (id, id_artiste) VALUES (15,1000);
USE bddSound; INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance,sexe,type,id_groupe) VALUES (2900,'BTS','Martin','BTS',STR_TO_DATE('01/05/1995', '%d/%m/%Y'),1,0,NULL);
USE bddSound; INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance,sexe,type,id_groupe,chemin_image) VALUES (89,'BTS','The','BTS',STR_TO_DATE('01/05/1995', '%d/%m/%Y'),1,0,NULL,'../resources/images/artiste/bts.png');
USE bddSound; INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance,sexe,type,id_groupe,chemin_image) VALUES (88,'Nathan','Drake','Drake',STR_TO_DATE('09/01/1990', '%d/%m/%Y'),1,0,NULL,'../resources/images/artiste/drake.png');
USE bddSound; INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance,sexe,type,id_groupe,chemin_image) VALUES (87,'Billie','Eilish','Bibi',STR_TO_DATE('25/11/2000', '%d/%m/%Y'),0,0,NULL,'../resources/images/artiste/billie.png');
USE bddSound; INSERT INTO artiste (id, nom, prenom, pseudo, date_naissance,sexe,type,id_groupe,chemin_image) VALUES (86,'Bieber','Justin','Juju',STR_TO_DATE('02/04/1996', '%d/%m/%Y'),1,0,NULL,'../resources/images/artiste/bieber.png');
USE bddSound; INSERT INTO discographie (id, id_artiste) VALUES (5,89);
USE bddSound; INSERT INTO discographie (id, id_artiste) VALUES (6,89);
USE bddSound; INSERT INTO discographie (id, id_artiste) VALUES (9,88);
USE bddSound; INSERT INTO discographie (id, id_artiste) VALUES (10,88);
USE bddSound; INSERT INTO discographie (id, id_artiste) VALUES (11,87);
USE bddSound; INSERT INTO discographie (id, id_artiste) VALUES (12,87);
USE bddSound; INSERT INTO discographie (id, id_artiste) VALUES (13,86);
DELETE FROM ajouter_favoris WHERE id=49811 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",11134,STR_TO_DATE("2023-06-06", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=11134 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",11134,STR_TO_DATE("2023-06-06", "%Y-%m-%d"))
USE bddSound; INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image,id_album) VALUES (666,'Welcome to the club',357,'../resources/sounds/club.mp3','../resources/images/morceau/club.png',15);
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",666,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
INSERT INTO ecoute (email,id,date_ecoute) VALUES ('b@b.b',666,3);
INSERT INTO ecoute (email,id,date_ecoute) VALUES ('b@b.b',651617,300);
INSERT INTO ecoute (email,id,date_ecoute) VALUES ('b@b.b',51617,300);
INSERT INTO ecoute (email,id,date_ecoute) VALUES ('b@b.b',87351,3000);
INSERT INTO ecoute (email,id,date_ecoute) VALUES ('b@b.b',11170,4000);
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",87351,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=11134 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",40445,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",49811,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=666 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",666,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=29694 AND email ="b@b.b"
DELETE FROM ajouter_favoris WHERE id=49811 AND email ="b@b.b"
DELETE FROM ajouter_favoris WHERE id=40445 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",40445,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=40445 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",40445,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=43003 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",43003,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=9105 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",9105,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=87351 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",87351,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=666 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",666,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=40445 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",40445,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=40445 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",40445,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=40445 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",40445,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=666 AND email ="b@b.b"
DELETE FROM ajouter_favoris WHERE id=87351 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",87351,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=87351 AND email ="b@b.b"
DELETE FROM ajouter_favoris WHERE id=43003 AND email ="b@b.b"
DELETE FROM ajouter_favoris WHERE id=55764 AND email ="b@b.b"
DELETE FROM ajouter_favoris WHERE id=40445 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",11170,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",11134,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=11134 AND email ="b@b.b"
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",11134,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",666,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
INSERT INTO ajouter_favoris (email,id,date_ajout) VALUES ("b@b.b",48914,STR_TO_DATE("2023-06-07", "%Y-%m-%d"))
DELETE FROM ajouter_favoris WHERE id=9105 AND email ="b@b.b"
DELETE FROM ajouter_favoris WHERE id=11170 AND email ="b@b.b"
