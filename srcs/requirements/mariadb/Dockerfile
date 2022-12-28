FROM    debian:buster

RUN     apt update && apt -y install mariadb-server

COPY    ./tools/script.sh /tmp/script.sh

ENTRYPOINT [ "/tmp/script.sh" ]

CMD ["mysqld_safe"]