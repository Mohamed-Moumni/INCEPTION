#!/bin/bash

useradd -m $FTP_USER

echo "$FTP_USER:$FTP_PASSWORD_USER" | chpasswd

mkdir -p /home/$FTP_USER/ftp # create ftp user

chown nobody:nogroup /home/$FTP_USER/ftp # set its ownership

chmod a-w /home/$FTP_USER/ftp # Remove write permissions

mkdir -p /home/$FTP_USER/ftp/files # create the directory for file uploads

chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files # ownership to the user

# configuration modification

sed -i 's/#write_enable=YES/write_enable=YES/g' /etc/vsftpd.conf

sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/g' /etc/vsftpd.conf

echo "user_sub_token=$FTP_USER" >> /etc/vsftpd.conf

echo "local_root=/home/$FTP_USER/ftp" >> /etc/vsftpd.conf

echo "pasv_min_port=30000" >> /etc/vsftpd.conf

echo "pasv_max_port=30009" >> /etc/vsftpd.conf

echo "userlist_enable=YES" >> /etc/vsftpd.conf

echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

mkdir -p /var/run/vsftpd/empty

exec "$@"