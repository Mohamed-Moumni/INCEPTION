#!/bin/bash

service mysql start

mysql -e "CREATE DATABASE inception_db;"

mysql -e "CREATE USER 'moumni'@'%' IDENTIFIED BY 'Moha';"

mysql -e "GRANT ALL PRIVILEGES ON inception_db.* TO 'moumni'@'%';"

mysql -e "FLUSH PRIVILEGES;"

mysql -e "SHOW DATABASES;"

mysql -e "select user from mysql.user;"
