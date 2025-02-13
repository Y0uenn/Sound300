#!/bin/bash
# C'est un script pour installer sur un serveur vierge Debian (non testé)
chmod 777 resources/images/compte
chmod 666 sql/addon.sql
if lsb_release -d | grep -q "Debian"; then
	apt update
	apt install mariadb-server php php-mysql apache2
	cp config/php.ini /etc/php/"$(ls -l | sort | grep d  | sed -n '$s/.* \([^ ]*\)$/\1/p')"/apache2/
	cp config/sound3000.conf /etc/apache2/sites-available/
	a2ensite /etc/apache2/sites-available/sound3000.conf
	systemctl enable apache2
	systemctl enable mariadb
	systemctl start apache2
	systemctl start mariadb
	systemctl restart apache2
	systemctl restart mariadb
	mysql -u root -e "source sql/init.sql"
fi

