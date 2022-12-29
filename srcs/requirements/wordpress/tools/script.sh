#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html/

if ! [ -f /var/www/html/wp-config.php ]
then
    wp core download  --allow-root
fi

sed -i 's/database_name_here/"$MYSQL_DATABASE"/g' /var/www/html/wp-config-sample.php
sed -i 's/username_here/"$MYSQL_USER"/g' /var/www/html/wp-config-sample.php
sed -i 's/password_here/"$MYSQL_PASSWORD"/g' /var/www/html/wp-config-sample.php
sed -i 's/localhost/"$HOST"/g' /var/www/html/wp-config-sample.php

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

wp core install --url=mmoumni.42.fr --title="My WordPress Site" --admin_user=moumni --admin_password=MohaMed --allow-root --admin_email=mohawatch101@gmail.com

exec "$@"
