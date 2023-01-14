# base image
FROM    debian:buster

# install nginx and openssl keys and certificates
RUN     apt update && apt -y install nginx && apt install -y openssl && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj="/CN=mmoumni/O=moumni.1337.ma/C=MA/L=KHOURIBGA"

# copy the script.sh from host into the container
COPY ./tools/script.sh /tmp/script.sh

# change permission for /tmp/script.sh
RUN chmod +x /tmp/script.sh

# run the /tmp/script.sh inside the container
ENTRYPOINT [ "/tmp/script.sh" ]

# running the nginx in daemon mode
CMD     ["nginx", "-g", "daemon off;"]