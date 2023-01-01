FROM    debian:buster

RUN     apt update && apt -y install nginx && apt install -y openssl && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj="/CN=mmoumni/O=moumni.1337.ma/C=MA/L=KHOURIBGA"

COPY    ./conf/default /etc/nginx/sites-enabled/default

CMD     ["nginx", "-g", "daemon off;"]