#!/bin/bash

echo -e "maxmemory 256mb \n maxmemory-policy allkeys-lfu" >> /etc/redis/redis.conf
echo -e "bind 0.0.0.0" >> /etc/redis/redis.conf

exec "$@"