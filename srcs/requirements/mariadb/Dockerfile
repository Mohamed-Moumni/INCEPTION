FROM    debian:buster

RUN apt update && apt -y install mariadb-server

COPY ./tools/init_database.sql /tmp/init_database.sql

RUN service mysql start && mysql < /tmp/init_database.sql 

CMD ["mysqld"]