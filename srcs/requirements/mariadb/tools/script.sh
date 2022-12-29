#!/bin/bash

service mysql start

if [ -d /var/lib/mysql/$MYSQL_DATABASE ]
then
    echo -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%';\nFLUSH PRIVILEGES;" > /tmp/init_db.sql
else
    echo -e "CREATE DATABASE $MYSQL_DATABASE;\nCREATE USER $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\nGRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%';\nFLUSH PRIVILEGES;" > /tmp/init_db.sql
fi

mysql < /tmp/init_db.sql

sed -i 's/bind-address/#bind-adress/' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql stop

exec "$@"