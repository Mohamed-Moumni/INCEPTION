FROM debian:buster

RUN apt update && apt install -y redis-server && apt install -y php-redis

COPY ./tools/script.sh /tmp/script.sh

RUN chmod +x /tmp/script.sh

ENTRYPOINT [ "/tmp/script.sh" ]

CMD ["redis-server", "/etc/redis/redis.conf"]