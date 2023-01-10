# base image
FROM debian:buster

# install mariadb server
RUN apt update && apt -y install mariadb-server

# copy the script.sh into container
COPY ./tools/script.sh /tmp/script.sh

# change the permission to the script.sh
RUN chmod +x /tmp/script.sh

# run the script.sh
ENTRYPOINT [ "/tmp/script.sh" ]

# running mysqld daemon
CMD [ "mysqld" ]