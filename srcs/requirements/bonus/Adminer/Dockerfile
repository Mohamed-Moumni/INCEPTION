# base image
FROM debian:buster
# instal php and php-mysql and wget to download adminer
RUN apt update -y && apt install -y php php-mysql && apt install -y wget && wget "http://www.adminer.org/latest.php" -O /var/www/html/index.php
#start an intrenal web server, the server on all available network interfaces and will listen to port 8081, the webserver root directory is /var/www/html/
CMD ["php", "-S", "0.0.0.0:8081", "-t", "/var/www/html"]