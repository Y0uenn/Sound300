# Sound3000
Audio player with favorites, playlists, research and a lot more
Rupioe did the backend and certain js animations and Youenn did the backend css html and js.

### Dependencies :
git
mariadb
apache2
php

### To install :
Il faut que resources/images/compte soit en 777
Il faut que sql/addon.sql ai les droits en écriture (w)
Veillez à avoir lancé et activé le virtual host, à avoir démarré les démons mariadb et apache. (+ réglages liaison apache-php si besoin)
```sh
$git clone https://github.com/Rupioe/Sound3000/tree/main
$cd Sound 3000
#chmod +x install.sh && ./install.sh # Le script est un peu violent, fait des maj tout seul et écrase des fichiers de config
 ```

### NB :
Le code d'AJAX est en grande partie pris des codes d'Imothep
Le code est à moitié commenté en anglais et en français, les variables aussi. Il n'y a pas de raisons particulières à cela.

### Arborescence :
```sh
.
├── config
│   ├── php.ini
│   └── sound3000.conf
├── css
│   ├── album.css
│   ├── artiste.css
│   ├── base.css
│   ├── connection.css
│   ├── header_footer.css
│   ├── history.css
│   ├── image
│   │   ├── calendar.svg
│   │   ├── key.svg
│   │   ├── mail2.svg
│   │   ├── mail.svg
│   │   ├── name.svg
│   │   └── password.svg
│   ├── music.css
│   ├── playlist.css
│   ├── pop-up.css
│   └── profil.css
├── favicon.ico
├── html
│   ├── footer.html
│   ├── header.html
│   └── image
│       ├── add.png
│       ├── download.svg
│       ├── end_fill.svg
│       ├── exit.png
│       ├── heart.png
│       ├── heart.svg
│       ├── music.png
│       ├── music.svg
│       ├── pause.png
│       ├── pause.svg
│       ├── play.png
│       ├── play.svg
│       ├── profil.png
│       ├── rectangle.jpg
│       ├── red_heart.png
│       ├── search.png
│       ├── start_fill.svg
│       └── volume.svg
├── index.html                // c'est une page de redirection vers le site et vers une branche avec un début de playlists
├── install.sh
├── js
│   ├── ajax_favorites.js
│   ├── ajax.js
│   ├── compte.js
│   ├── header.js
│   ├── heart.js
│   ├── play.js
│   ├── pop-up.js
│   └── profil.js
├── LICENSE
├── php
│   ├── album.php
│   ├── artiste.php
│   ├── connection.php
│   ├── constants.php
│   ├── creer.php
│   ├── db.php
│   ├── favorites.php
│   ├── history.php
│   ├── index.php
│   ├── music.php
│   ├── PasDeTokenPasDeChocolat.php
│   ├── profil.php
│   ├── request_favorites.php
│   ├── request_history.php
│   ├── request.php
│   └── token.php
├── README.md
├── resources
│   ├── images
│   │   ├── album
│   │   │   ├── album.png
│   │   │   ├── butter.png
│   │   │   ├── certified_lover_boy.png
│   │   │   ├── divide.png
│   │   │   ├── fearless.png
│   │   │   ├── futur_nostalgia.png
│   │   │   ├── happier_than_ever.png
│   │   │   ├── justice.png
│   │   │   ├── map_of_the_soul_7.png
│   │   │   ├── no_6_collaborations_project.png
│   │   │   ├── positions.png
│   │   │   ├── red.png
│   │   │   ├── reputation.png
│   │   │   ├── scorpion.png
│   │   │   ├── sweetener.png
│   │   │   └── when_we_all_fall_asleep.png
│   │   ├── artiste
│   │   │   ├── ariana_grande.png
│   │   │   ├── artiste.png
│   │   │   ├── bieber.png
│   │   │   ├── billie.png
│   │   │   ├── bts.png
│   │   │   ├── camila_cabello.png
│   │   │   ├── drake.png
│   │   │   ├── dua_lipa.png
│   │   │   ├── ed_sheeran.png
│   │   │   ├── enrique_iglesias.png
│   │   │   ├── lana_del_rey.png
│   │   │   ├── lil_nas_x.png
│   │   │   ├── megan_thee_stallion.png
│   │   │   ├── post_malone.png
│   │   │   ├── taylor_swift.png
│   │   │   └── travis_scott.png
│   │   ├── compte
│   │   │   ├── compte.png
│   │   │   ├── doom.jpg
│   │   │   ├── evilcorp.jpg
│   │   │   ├── fmahand.jpg
│   │   │   ├── fma.jpg
│   │   │   ├── fromage_bite.jpg
│   │   │   ├── hellwarrior2.PNG
│   │   │   ├── LFSforbabies.jpg
│   │   │   ├── maserati.png
│   │   │   ├── neofetchelliot.png.old
│   │   │   ├── neon.jpg
│   │   │   ├── philosopher_stone_circle.jpg
│   │   │   ├── pparch.jpg
│   │   │   ├── retrowave.jpg
│   │   │   ├── theyacide.jpg
│   │   │   ├── unbroken.jpg
│   │   │   ├── unlocked.png
│   │   │   └── winscreen.jpg
│   │   └── morceau
│   │       ├── 34_35.png
│   │       ├── anyone.png
│   │       ├── break_my_heart.png
│   │       ├── castle_on_the_hill.png
│   │       ├── club.png
│   │       ├── delicate.png
│   │       ├── dont_start_now.png
│   │       ├── galway_girl.png
│   │       ├── getaway_car.png
│   │       ├── goldwing.png
│   │       ├── gorgeous.png
│   │       ├── hallucinate.png
│   │       ├── happier.png
│   │       ├── hold_on.png
│   │       ├── holy.png
│   │       ├── levitating.png
│   │       ├── lonely.png
│   │       ├── look_what_you_made_me_do.png
│   │       ├── lost_cause.png
│   │       ├── love_again.png
│   │       ├── musique.png
│   │       ├── my_future.png
│   │       ├── oxytocin.png
│   │       ├── peaches.png
│   │       ├── perfect.png
│   │       ├── physical.png
│   │       ├── positions.png
│   │       ├── pov.png
│   │       ├── ready_for_it.png
│   │       ├── shape_of_you.png
│   │       └── therefore_i_am.png
│   └── sounds
│       ├── 34_35.mp3
│       ├── anyone.mp3
│       ├── break_my_heart.mp3
│       ├── castle_on_the_hill.mp3
│       ├── club.mp3
│       ├── delicate.mp3
│       ├── dont_start_now.mp3
│       ├── galway_girl.mp3
│       ├── getaway_car.mp3
│       ├── goldwing.mp3
│       ├── gorgeous.mp3
│       ├── hallucinate.mp3
│       ├── happier.mp3
│       ├── hold_on.mp3
│       ├── holy.mp3
│       ├── levitating.mp3
│       ├── lonely.mp3
│       ├── look_what_you_made_me_do.mp3
│       ├── lost_cause.mp3
│       ├── love_again.mp3
│       ├── my_future.mp3
│       ├── oxytocin.mp3
│       ├── peaches.mp3
│       ├── perfect.mp3
│       ├── physical.mp3
│       ├── positions.mp3
│       ├── pov.mp3
│       ├── ready_for_it.mp3
│       ├── shape_of_you.mp3
│       └── therefore_i_am.mp3
├── Scripts
│   ├── add.sh
│   └── update.sh
└── sql
    ├── addon.sql
    ├── albumsGPT.sql
    ├── artistesGPT.sql
    ├── bdd3000.sql
    ├── init.sql
    ├── morceauxGPT.sql
    ├── patchArtisteImg.sql
    ├── patchHistory.sql
    ├── patchToken.sql
    └── profilPic.sql

17 directories, 190 files
```
