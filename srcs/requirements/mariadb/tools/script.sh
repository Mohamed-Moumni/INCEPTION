#!/bin/bash

service mysql start

if [ -d /var/lib/mysql/$MYSQL_DATABASE ]
then
    echo -e "CREATE USER $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\nGRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';\nFLUSH PRIVILEGES;" > /tmp/init_db.sql
else
    echo -e "CREATE DATABASE $MYSQL_DATABASE;\nCREATE USER $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\nGRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%';\nFLUSH PRIVILEGES;" > /tmp/init_db.sql
fi

mysql < /tmp/init_db.sql

sed -e '/s//'

service mysql stop

exec "$@"
