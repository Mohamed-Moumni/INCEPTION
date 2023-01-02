#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

chown -R www-data:www-data /var/www/html/

chmod -R 755 /var/www/html/

cd /var/www/html/

wp core download --allow-root

touch wp-config.php

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i '36 s/\/run\/php\/php7.3-fpm.sock/9000/' /etc/php/7.3/fpm/pool.d/www.conf

sed -i 's/database_name_here/'$MYSQL_DATABASE'/g' /var/www/html/wp-config.php

sed -i 's/username_here/'$MYSQL_USER'/g' /var/www/html/wp-config.php

sed -i 's/password_here/'$MYSQL_PASSWORD'/g' /var/www/html/wp-config.php

sed -i 's/localhost/'$HOST'/g' /var/www/html/wp-config.php

wp core install --url=mmoumni.42.fr --title="My Wordpress Site" --admin_user=moumni --admin_password=MohaMed --admin_email=mohawatch101@gmail.com --allow-root

wp user create moumni2 mohamedmoulin7@gmail.com --role='author' --display_name="Rigor" --allow-root

echo "Wordpress Setup is finnished\n"

exec "$@"