FROM    debian:buster

RUN     apt update && apt -y install mariadb-server

COPY    ./tools/script.sh /tmp/script.sh

CMD     ["/tmp/script.sh"]