# base image
FROM    debian:buster

# install nginx and openssl keys and certificates
RUN     apt update && apt -y install nginx && apt install -y openssl && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj="/CN=mmoumni/O=moumni.1337.ma/C=MA/L=KHOURIBGA"

# copy the default configuration into the container
COPY    ./conf/default /etc/nginx/sites-enabled/default

# running the nginx in daemon mode
CMD     ["nginx", "-g", "daemon off;"]