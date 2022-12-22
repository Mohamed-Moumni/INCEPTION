FROM    debian:buster

RUN apt update && apt -y install mariadb-server

COPY ./tools/script.sh /tmp/script.sh

CMD ["chmod", "+x", "/tmp/script.sh"]

ENTRYPOINT [ "/tmp/script.sh"]