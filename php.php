install php - a web-side script language

	$ sudo apt install libapache2-mod-php

	recommended:

	$ sudo apt install php-gd php-mysql

	after the installation of php, you need to restart apache
	if you already installed it.

install apache2 - a web server

	$ sudo apt install apache2

	start server

	$ sudo /etc/init.d/apache2 restart

	launch the browser and type in http://localhost or http://127.0.0.1
	to see if it works!

	apache has made subdir /var/www , the root dir of the server.
	you may want to grant visit privilege to /var/www:

	$ sudo chmod 777 /var/www

	to test:

	$ echo '<?php echo "hello, world!"?>' >> /var/www/html/test.php

	then visit http://localhost/test.php to see if it works!

install mysql - a database software

	$ sudo apt install mysql-server mysql-client

	alternatively, you can install mariadb instead.
	you have to set a root password for mysql.

install phpmyadmin - a manager for mysql

	$ sudo apt install phpmyadmin

	choose apache2 during installation.
	link phpmyadmin with apache2, like:

	$ sudo ln -s /usr/share/phpmyadmin /var/www

	launch the browser and visit http://localhost/phpmyadmin to see if it
	works!

