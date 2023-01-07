#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar #curl is a command-line tool that is used to transfer data from or to a server. it support various protocols like HTTP, HTTPS, FTP, 

chown -R www-data:www-data /var/www/html/ # 
chmod -R 755 /var/www/html/ #changing the owner of /var/www/html/ to 755 and all subdirectories

chmod +x wp-cli.phar # is an archive that contains WP-CLI tool.
mv wp-cli.phar /usr/local/bin/wp # 

cd /var/www/html/
wp core download --allow-root
touch wp-config.php
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i '36 s/\/run\/php\/php7.3-fpm.sock/9000/' /etc/php/7.3/fpm/pool.d/www.conf
sed -i 's/database_name_here/'$MYSQL_DATABASE'/g' /var/www/html/wp-config.php
sed -i 's/username_here/'$MYSQL_USER'/g' /var/www/html/wp-config.php
sed -i 's/password_here/'$MYSQL_PASSWORD'/g' /var/www/html/wp-config.php
sed -i 's/localhost/'$HOST'/g' /var/www/html/wp-config.php
wp core install --url=$URL --title="My Wordpress Site" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
wp user create $USER $USER_PASSWORD $USER_EMAIL --role='author' --display_name=$DISPLAY_NAME --allow-root    
wp plugin install redis-cache --activate --allow-root #install the plugin of redis-cache
echo -e "define('WP_REDIS_HOST', 'redis');\ndefine('WP_REDIS_PORT', '6379');" >> wp-config.php
echo -e "define( 'WP_CACHE_KEY_SALT', 'localhost' );\ndefine( 'WP_CACHE', true );" >> wp-config.php

exec "$@"