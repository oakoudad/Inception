#!/bin/bash

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DB.* to '$MYSQL_USER'@'%';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;"
# mariadb -e "FLUSH PRIVILEGES;"

mysqladmin -u root --password=$MYSQL_ROOT_PASSWORD shutdown


mysqld_safe


#!/bin/bash

# # Update the MySQL/MariaDB configuration
# sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# # Start the MariaDB service
# echo "01 ------"
# service mariadb start

# # Use 'mysql' command to set a password for the root user
# echo "02 ------"
# mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;"

# # Create a database and user with privileges
# mariadb -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"
# mariadb -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
# mariadb -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MYSQL_DB.* to '$MYSQL_USER'@'%';"
# mariadb -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

# echo "03 ------"
# mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

# # Start the MariaDB service again
# echo "04 ------"
# mysqld_safe
