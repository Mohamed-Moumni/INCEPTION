FROM debian:buster

RUN apt update && apt install -y php php-cli php-common php-bcmath php-curl php-gd php-imagick php-mbstring php-mysql php-opcache php-xml php-zip ghostscript \
    && apt install -y php7.3-fpm \
    && apt install -y curl \
    && apt install -y sendmail

RUN mkdir -p /run/php/

COPY ./tools/script.sh /tmp/script.sh

EXPOSE 9000

ENTRYPOINT [ "/tmp/script.sh" ]

CMD [ "php-fpm7.3", "-F"]