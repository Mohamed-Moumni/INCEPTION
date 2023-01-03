#!/bin/bash

sed -i 's/#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

sed -i 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > /tmp/init_db.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> /tmp/init_db.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> /tmp/init_db.sql
echo "FLUSH PRIVILEGES;" >> /tmp/init_db.sql

mysql < /tmp/init_db.sql

service mysql stop

exec "$@"