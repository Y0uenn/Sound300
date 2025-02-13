#!/bin/bash
# Script d'ajout à la base de donnée pour faciliter l'ajout de données personnalisées
ENCORE="y"

while [ "$ENCORE" == "y" ]; do
	echo -e '1)Album\n2)Artiste\n3)Morceau\n4)Groupe\n5)Discographie'
	read -r CHOIX

	if [ "$CHOIX" -eq 1 ]; then
		CHOSEN="album"
		mysql -u root -e "USE bddSound; SHOW COLUMNS FROM $CHOSEN; SELECT FOUND_ROWS();" 
		echo "ID (int)"
		read -r ID
		echo Titre
		read -r TITRE
		echo date : DD/MM/YYYY
		read -r DATE_PARUTION
		echo Chemin image
		read -r CHEMIN_IMAGE
		mysql -u root -e "USE bddSound; SELECT * FROM styles;" 
		read -r STYLE

		mysql -u root -e "USE bddSound; INSERT INTO $CHOSEN (id, titre, date_parution, chemin_image, style) VALUES ($ID,'$TITRE',STR_TO_DATE('$DATE_PARUTION', '%d/%m/%Y'),'$CHEMIN_IMAGE','$STYLE');"
		echo "USE bddSound; INSERT INTO $CHOSEN (id, titre, date_parution, chemin_image, style) VALUES ($ID,'$TITRE',STR_TO_DATE('$DATE_PARUTION', '%d/%m/%Y'),'$CHEMIN_IMAGE','$STYLE');" >> ../sql/addon.sql
	fi

	if [ "$CHOIX" -eq 2 ]; then
		CHOSEN="artiste"
		mysql -u root -e "USE bddSound; SELECT id, nom, prenom, pseudo FROM $CHOSEN; SHOW COLUMNS FROM $CHOSEN; SELECT FOUND_ROWS();" 
		echo "ID (int)"
		read -r ID
		echo nom
		read -r NOM
		echo prenom
		read -r PRENOM
		echo pseudo
		read -r PSEUDO
		echo date : DD/MM/YYYY
		read -r DATE_NAISSANCE
		echo Sexe H/F
		read -r SEXE # Homme c'est 1
		if [ "$SEXE" == "H" ]; then
			SEXE=1
		else
			SEXE=0
		fi
		echo nom image
		read -r CHEMIN_ARTISTE
		echo "Groupe ou Seul ? G/[S]"
		read -r TYPE # Groupe c'est 1
		if [ "$TYPE" == "G" ]; then
			TYPE=1
			echo "id du groupe ? (int)"
			mysql -u root -e "USE bddSound; SELECT * FROM groupe;" 
			read -r IDGROUPE
			IDGROUPE=\'$IDGROUPE\'
		else
			TYPE=0
			IDGROUPE="NULL"
		fi
		mysql -u root -e "USE bddSound; INSERT INTO $CHOSEN (id, nom, prenom, pseudo, date_naissance,sexe,type,id_groupe,chemin_image) VALUES ($ID,'$NOM','$PRENOM','$PSEUDO',STR_TO_DATE('$DATE_NAISSANCE', '%d/%m/%Y'),$SEXE,$TYPE,$IDGROUPE,'../resources/images/artiste/$CHEMIN_ARTISTE');"
		echo "USE bddSound; INSERT INTO $CHOSEN (id, nom, prenom, pseudo, date_naissance,sexe,type,id_groupe,chemin_image) VALUES ($ID,'$NOM','$PRENOM','$PSEUDO',STR_TO_DATE('$DATE_NAISSANCE', '%d/%m/%Y'),$SEXE,$TYPE,$IDGROUPE,'../resources/images/artiste/$CHEMIN_ARTISTE');" >> ../sql/addon.sql
	fi

	if [ "$CHOIX" -eq 3 ]; then
		CHOSEN="morceau"
		mysql -u root -e "USE bddSound; SHOW COLUMNS FROM $CHOSEN; SELECT FOUND_ROWS();" 
		echo "ID (int)"
		read -r ID
		echo Titre
		read -r TITRE
		echo Durée en secondes
		read -r DUREE
		echo Chemin musique
		read -r CHEMIN_MUSIQUE
		echo Chemin image
		read -r CHEMIN_IMAGE
		mysql -u root -e "USE bddSound; SELECT * FROM album;" 
		read -r IDALBUM

		mysql -u root -e "USE bddSound; INSERT INTO $CHOSEN (id, titre, duree, chemin_musique, chemin_image,id_album) VALUES ($ID,'$TITRE',$DUREE,'$CHEMIN_MUSIQUE','$CHEMIN_IMAGE',$IDALBUM);"
		echo "USE bddSound; INSERT INTO $CHOSEN (id, titre, duree, chemin_musique, chemin_image,id_album) VALUES ($ID,'$TITRE',$DUREE,'$CHEMIN_MUSIQUE','$CHEMIN_IMAGE',$IDALBUM);" >> ../sql/addon.sql
	fi

	if [ "$CHOIX" -eq 4 ]; then
		CHOSEN="groupe"
		mysql -u root -e "USE bddSound; SHOW COLUMNS FROM $CHOSEN; SELECT FOUND_ROWS();" 
		echo "ID (int)"
		read -r ID
		echo Nom
		read -r NOM
		echo date : DD/MM/YYYY
		read -r DATE_CREATION

		mysql -u root -e "USE bddSound; INSERT INTO $CHOSEN (id, nom, date_creation) VALUES ($ID,'$NOM',STR_TO_DATE('$DATE_CREATION', '%d/%m/%Y'));"
		echo "USE bddSound; INSERT INTO $CHOSEN (id, nom, date_creation) VALUES ($ID,'$NOM',STR_TO_DATE('$DATE_CREATION', '%d/%m/%Y'));" >> ../sql/addon.sql
	fi


	if [ "$CHOIX" -eq 5 ]; then
		CHOSEN="discographie"
		mysql -u root -e "USE bddSound; SHOW COLUMNS FROM $CHOSEN; SELECT FOUND_ROWS();" 
		echo "ID album (int)"
		mysql -u root -e "USE bddSound; SELECT * FROM album;" 
		read -r ID_ALBUM
		echo "ID artiste (int)"
		mysql -u root -e "USE bddSound; SELECT * FROM artiste;" 
		read -r ID_ARTISTE

		mysql -u root -e "USE bddSound; INSERT INTO $CHOSEN (id, id_artiste) VALUES ($ID_ALBUM,$ID_ARTISTE);"
		echo "USE bddSound; INSERT INTO $CHOSEN (id, id_artiste) VALUES ($ID_ALBUM,$ID_ARTISTE);" >> ../sql/addon.sql
	fi

	### Encore un ajout ?
	echo -e 'Insertion ? [Y]/N'
	read -r ENCORE
	if [ "$ENCORE" == "" ]; then
		ENCORE="y"
	fi

done
