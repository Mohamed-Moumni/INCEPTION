#!/bin/bash

service mysql start

mysql -e "ALTER USER root@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

if ! [ -f /var/lib/mysql/$MYSQL_DATABASE ]; then
    mysql -u root -p$MYSQL_ROOT_PASSWORD -Bse "CREATE DATABASE $MYSQL_DATABASE;"
fi

mysql -u root -p$MYSQL_ROOT_PASSWORD -Bse "CREATE USER $MYSQL_USER@localhost IDENTIFIED BY '$MYSQL_PASSWORD';GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@localhost;FLUSH PRIVILEGES;SHOW DATABASES;SELECT User FROM mysql.user;"