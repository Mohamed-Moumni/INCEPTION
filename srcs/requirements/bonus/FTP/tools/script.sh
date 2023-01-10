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
# sets the chroot jail for local users to their home directory
echo "chroot_local_user=YES" >> /etc/vsftpd.conf;
# allows write access for local within their chroot jail
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf;
# set the FTP_USER as user substitution token
echo "user_sub_token=$FTP_USER" >> /etc/vsftpd.conf
# enables local user login
echo "local_enable=YES" >> /etc/vsftpd.conf
# line sets the FTP root directory for the local user to /home/$FTP_USER/ftp
echo "local_root=/home/$FTP_USER/ftp" >> /etc/vsftpd.conf
# sets the minimum port for passive mode data connections
echo "pasv_min_port=30000" >> /etc/vsftpd.conf
# sets the maximum port for passive mode data connections
echo "pasv_max_port=30009" >> /etc/vsftpd.conf
# enables the use of the userlist_file option
echo "userlist_enable=YES" >> /etc/vsftpd.conf
# sets the path to the userlist file
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf
# sets that the file's contents will be used to specify users who are NOT allowed to log in
echo "userlist_deny=NO" >> /etc/vsftpd.conf
# appends the value of the FTP_USER variable to the userlist file.
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

# stop the service of vsftpd
service vsftpd stop

exec "$@"