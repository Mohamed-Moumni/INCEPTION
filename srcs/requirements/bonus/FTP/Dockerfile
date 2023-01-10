#base image
FROM debian:buster

# install vsftpd (Very Secure FTP Daemon)
RUN apt update && apt install -y vsftpd 

# copy the script.sh from the host machine into container
COPY ./tools/script.sh /tmp/script.sh 

# change the file permission of the script to be excutable
RUN chmod +x ./tmp/script.sh 

# run the script inside the container
ENTRYPOINT [ "/tmp/script.sh" ]

# run the vsftpd
CMD ["usr/sbin/vsftpd"]