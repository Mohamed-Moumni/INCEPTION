FROM    debian:buster

RUN     apt update && apt -y install mariadb-server

COPY    ./tools/script.sh /tmp/script.sh

ENTRYPOINT [ "/tmp/script.sh" ]

EXPOSE 3306

CMD ["mysqld_safe"]