#!/bin/bash

service mysql start

echo "CREATE DATABASE $MYSQL_DATABASE;\nCREATE USER $MYSQL_USER@'%' IDENTIFIED BY $MYSQL_PASSWORD;\nGRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%';\nFLUSH PRIVILEGES;" > /tmp/init_db.sql

mysql < /tmp/init_db.sql

mysqld