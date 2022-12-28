#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html/

wp core download  --allow-root 

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i 's/database_name_here/DB/g' /var/www/html/wp-config.php
sed -i 's/username_here/wordpress/g' /var/www/html/wp-config.php
sed -i 's/password_here/Moha/g' /var/www/html/wp-config.php
sed -i 's/localhost/mariadb/g' /var/www/html/wp-config.php

wp core install --url=mmoumni.42.fr --title="My WordPress Site" --admin_user=moumni --admin_password=MohaMed --allow-root
