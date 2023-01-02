#!/bin/bash

sed -i 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql -u root -p"$MYSQL_ROOTPASSWORD" "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOTPASSWORD')";
mysql -u root -p"$MYSQL_ROOTPASSWORD" "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE"; 
mysql -u root -p"$MYSQL_ROOTPASSWORD" "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'";
mysql -u root -p"$MYSQL_ROOTPASSWORD" "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'";
mysql -u root -p"$MYSQL_ROOTPASSWORD" "FLUSH PRIVILEGES";

echo "mariadb setup is ended\n"

exec "$@"