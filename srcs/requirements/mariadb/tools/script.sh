#!/bin/bash

# sed -i 's/#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

sed -i 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql -u root -p${MYSQL_ROOTPASSWORD} -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -u root -p${MYSQL_ROOTPASSWORD} -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -p${MYSQL_ROOTPASSWORD} -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';"
mysql -u root -p${MYSQL_ROOTPASSWORD} -e "FLUSH PRIVILEGES;"
# mysql -u root -p${MYSQL_ROOTPASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOTPASSWORD';"

service mysql stop

exec "$@"