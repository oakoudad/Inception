#!/bin/bash

mkdir -p /var/www/html
cd /var/www/html


wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
wp config set DB_NAME $MYSQL_DB --allow-root
wp config set DB_USER $MYSQL_USER --allow-root
wp config set DB_HOST mariadb --allow-root
wp config set DB_PASSWORD $MYSQL_PASSWORD --allow-root

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
wp plugin update --all --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

chown -R www-data:www-data /var/www/html

/usr/sbin/php-fpm7.4 -F
