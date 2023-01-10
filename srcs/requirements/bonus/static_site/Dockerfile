# base image
FROM debian:buster
# install apache2 webserver
RUN apt update && apt install -y apache2
# create folder for the website files and  (by Default the configuration of the owner is www-data in debian configuration of Apache2)
# Since that is the default configuration, you conveniently know the ownership needed for your web files.
RUN mkdir -p /var/www/html/mywebsite && chown -R www-data:www-data /var/www/html/mywebsite

# copy the website folder int the container
COPY ./tools/mywebsite /var/www/html/mywebsite

# copy the configuration for Apache2
COPY ./conf/000-default.conf /etc/apache2/sites-available/000-default.conf

# running the apache2 in the foreground mode
# foreground mode : The foreground process will not allow you to use terminal unless the process is completed
#  in this case if you need to access back to your terminal then you have to open a new terminal window or 
# stop the running process or kill it.
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]