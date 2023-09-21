#!/bin/bash

#create folder
mkdir /var/www/
mkdir /var/www/html
cd /var/www/html


#install wp
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root

mv /wp-config.php /var/www/html/wp-config.php

#update info sql connect mariadb
sed -i -r "s/mysql_db_here/$MYSQL_DB/1"   wp-config.php
sed -i -r "s/mysql_user_here/$MYSQL_USER/1"  wp-config.php
sed -i -r "s/mysql_password_here/$MYSQL_PASSWORD/1"    wp-config.php

#config wordpress
wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
wp plugin update --all --allow-root

# change port in php
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# run 
/usr/sbin/php-fpm7.4 -F