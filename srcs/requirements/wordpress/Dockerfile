# base image
FROM    debian:buster

# install php and php-curl and php-mysql and php7.3-fpm and curl and sendmail
RUN apt update && apt install -y php php-curl php-mysql\
    && apt install -y php7.3-fpm \
    && apt install -y curl \
    && apt install -y sendmail

# create the /run/php/ used for storing session data, temporary files, or other types of data that is generated and used by PHP while it's running
RUN mkdir -p /run/php/

# copy the script.sh into the container
COPY ./tools/script.sh /tmp/script.sh

# change the permission of script.sh
RUN chmod +x /tmp/script.sh

# run the script.sh
ENTRYPOINT [ "/tmp/script.sh" ]

# PHP-FPM to run in the foreground, that is, to not fork into the background as a daemon. This makes it so that the process will run and output any logs to the console where it was started.
CMD [ "php-fpm7.3", "-F" ]
