FROM    debian:buster

RUN apt update && apt install -y php php-curl php-mysql\
    && apt install -y php7.3-fpm \
    && apt install -y curl \
    && apt install -y sendmail

RUN mkdir -p /run/php/

COPY ./tools/script.sh /tmp/script.sh

RUN chmod +x /tmp/script.sh

ENTRYPOINT [ "/tmp/script.sh" ]

CMD [ "php-fpm7.3", "-F" ]

EXPOSE 9000
