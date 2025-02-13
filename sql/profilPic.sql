use bddSound;
ALTER TABLE compte MODIFY COLUMN chemin_image VARCHAR(400);
UPDATE compte set chemin_image='https://www.chartsinfrance.net/style/breves/3/photo_1371051750.png' WHERE email='a@a.a';
