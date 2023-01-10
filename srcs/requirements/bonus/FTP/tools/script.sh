#!/bin/bash

# start vsftpd service
service vsftpd start
# create ftp user
adduser --gecos "" $FTP_USER 
# set password for ftp user
echo "$FTP_USER:$FTP_PASSWORD_USER" | chpasswd
# Create the ftp folder
mkdir -p /home/$FTP_USER/ftp
# set its ownership
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp
# Remove write permissions
chmod a-w /home/$FTP_USER/ftp 

# disables anonymous login to the FTP server
echo "anonymous_enable=NO" >> /etc/vsftpd.conf;
# enables write permissions for the FTP users.
echo "write_enable=YES" >> /etc/vsftpd.conf;
# 
echo "chroot_local_user=YES" >> /etc/vsftpd.conf;

echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf;

echo "user_sub_token=$FTP_USER" >> /etc/vsftpd.conf

echo "local_enable=YES" >> /etc/vsftpd.conf

echo "local_root=/home/$FTP_USER/ftp" >> /etc/vsftpd.conf

echo "pasv_min_port=30000" >> /etc/vsftpd.conf

echo "pasv_max_port=30009" >> /etc/vsftpd.conf

echo "userlist_enable=YES" >> /etc/vsftpd.conf

echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

echo "userlist_deny=NO" >> /etc/vsftpd.conf

echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

service vsftpd stop

exec "$@"