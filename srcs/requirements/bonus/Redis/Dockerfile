# Base Image
FROM debian:buster
# Install redis-server and install php-redis
RUN apt update && apt install -y redis-server && apt install -y php-redis
# change the bind adress from listening 127.0.01 to 0.0.0.0 
# tha means Redis will only accept client connections made to 0.0.0.0 (accept connection to any address)
RUN sed -i 's/bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf
# maxmemory dictates the amount of memory allocated for a data set.
# If maxmemory is reached, you lose data only if the eviction policy set in maxmemory-policy indicates Redis to evict
# some keys and how to select these keys (volatile or all, lfu/lru/ttl/random). Otherwise, Redis start rejecting write
# commands to preserve the data already in memory. Read commands continue to be served.
RUN echo "maxmemory 256mb">> /etc/redis/redis.conf && echo "maxmemory-policy allkeys-lfu" >> /etc/redis/redis.conf
# The Redis server is an in-memory data store , Redis will accept connection from any host (useful for development or testing environments)
CMD ["redis-server", "--protected-mode", "no"]