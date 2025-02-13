### A lancer depuis la racine

CREATE DATABASE bddSound DEFAULT CHARACTER SET utf8 DEFAULT COLLATE  utf8_general_ci;
USE bddSound;
CREATE USER 'dummy'@'localhost' IDENTIFIED BY 'ymmud';
GRANT ALL PRIVILEGES ON *.* TO 'dummy'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON bddSound.* TO 'dummy'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
source sql/bdd3000.sql
source sql/addon.sql
source sql/patchToken.sql
source sql/patchArtisteImg.sql
source sql/artistesGPT.sql
source sql/profilPic.sql
source sql/albumsGPT.sql
source sql/morceauxGPT.sql
soure sql/patchHistory.sql
