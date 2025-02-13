# La requête :
# INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image,id_album) VALUES ($ID,'$TITRE',$DUREE,'$CHEMIN_MUSIQUE','$CHEMIN_IMAGE',$IDALBUM); Complète cette requête avec des morceaux des albums que tu m'as donné précedemment, je veux 10 morceaux par album. Dans $ID génère un nombre aléatoire, dans $TITRE met le titre, dans $DATE_PARUTION met une date au format : DD/MM/YYYY, dans chemin image met : "../resources/images/morceau/nom_morceau.png et remplace nom_morceau.png par le nom du morceau et dans chemin_musique met : "../resources/sounds/nom_morceau.mp3 et remplace nom_morceau.mp3 par le nom du morceau et dans $IDALBUM met un nombre qui s'incrémente quand on change d'album et le même pour les morceaux du même album.
# #--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#---

use bddSound;

DELETE FROM morceau;

#-- Morceaux pour l'album "÷" d'Ed Sheeran (ID Album: 1)

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Shape of You', 235, '../resources/sounds/shape_of_you.mp3', '../resources/images/morceau/shape_of_you.png', 3);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Castle on the Hill', 269, '../resources/sounds/castle_on_the_hill.mp3', '../resources/images/morceau/castle_on_the_hill.png', 3);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Galway Girl', 170, '../resources/sounds/galway_girl.mp3', '../resources/images/morceau/galway_girl.png', 3);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Perfect', 263, '../resources/sounds/perfect.mp3', '../resources/images/morceau/perfect.png', 3);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Happier', 207, '../resources/sounds/happier.mp3', '../resources/images/morceau/happier.png', 3);


#-- Morceaux pour l'album "Reputation" de Taylor Swift (ID Album: 2)
INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Delicate', 234, '../resources/sounds/delicate.mp3', '../resources/images/morceau/delicate.png', 15);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Look What You Made Me Do', 211, '../resources/sounds/look_what_you_made_me_do.mp3', '../resources/images/morceau/look_what_you_made_me_do.png', 15);


INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, '...Ready for It?', 211, '../resources/sounds/ready_for_it.mp3', '../resources/images/morceau/ready_for_it.png', 15);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Gorgeous', 231, '../resources/sounds/gorgeous.mp3', '../resources/images/morceau/gorgeous.png', 15);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Getaway Car', 239, '../resources/sounds/getaway_car.mp3', '../resources/images/morceau/getaway_car.png', 15);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Look What You Made Me Do', 211, '../resources/sounds/look_what_you_made_me_do.mp3', '../resources/images/morceau/look_what_you_made_me_do.png', 15);



#-- Morceaux pour l'album "Future Nostalgia" de Dua Lipa (ID Album: 3)

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Dont Start Now', 183, '../resources/sounds/dont_start_now.mp3', '../resources/images/morceau/dont_start_now.png', 14);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Physical', 208, '../resources/sounds/physical.mp3', '../resources/images/morceau/physical.png', 14);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Levitating', 205, '../resources/sounds/levitating.mp3', '../resources/images/morceau/levitating.png', 14);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Break My Heart', 221, '../resources/sounds/break_my_heart.mp3', '../resources/images/morceau/break_my_heart.png', 14);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Hallucinate', 203, '../resources/sounds/hallucinate.mp3', '../resources/images/morceau/hallucinate.png', 14);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Love Again', 285, '../resources/sounds/love_again.mp3', '../resources/images/morceau/love_again.png', 14);


#-- Morceaux pour l'album "Justice" de Justin Bieber (ID Album: 4)

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Peaches', 198, '../resources/sounds/peaches.mp3', '../resources/images/morceau/peaches.png', 13);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Hold On', 171, '../resources/sounds/hold_on.mp3', '../resources/images/morceau/hold_on.png', 13);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Anyone', 186, '../resources/sounds/anyone.mp3', '../resources/images/morceau/anyone.png', 13);



INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Lonely', 181, '../resources/sounds/lonely.mp3', '../resources/images/morceau/lonely.png', 13);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Holy', 257, '../resources/sounds/holy.mp3', '../resources/images/morceau/holy.png', 13);



#-- Morceaux pour l'album "Happier Than Ever" de Billie Eilish (ID Album: 5)

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Therefore I Am', 174, '../resources/sounds/therefore_i_am.mp3', '../resources/images/morceau/therefore_i_am.png', 12);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'My Future', 209, '../resources/sounds/my_future.mp3', '../resources/images/morceau/my_future.png', 12);


INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Lost Cause', 209, '../resources/sounds/lost_cause.mp3', '../resources/images/morceau/lost_cause.png', 12);


INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'Oxytocin', 192, '../resources/sounds/oxytocin.mp3', '../resources/images/morceau/oxytocin.png', 12);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'GOLDWING', 237, '../resources/sounds/goldwing.mp3', '../resources/images/morceau/goldwing.png', 12);

#-- Morceaux pour l'album "Positions" d'Ariana Grande (ID Album: 6)

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'positions', 173, '../resources/sounds/positions.mp3', '../resources/images/morceau/positions.png', 8);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, '34+35', 173, '../resources/sounds/34_35.mp3', '../resources/images/morceau/34_35.png', 8);

INSERT INTO morceau (id, titre, duree, chemin_musique, chemin_image, id_album)
VALUES (FLOOR(RAND() * 100000) + 1, 'pov', 210, '../resources/sounds/pov.mp3', '../resources/images/morceau/pov.png', 8);


