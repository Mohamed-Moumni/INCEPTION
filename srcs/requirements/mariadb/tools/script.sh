#!/bin/bash

# sed -i 's/#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

sed -i 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOTPASSWORD';FLUSH PRIVILEGES;" | mysql -u root

exec "$@"