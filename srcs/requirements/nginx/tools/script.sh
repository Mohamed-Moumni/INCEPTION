#!/bin/bash

echo "server
{
    listen 443 ssl;
    root /var/www/html;
    index index.php;
    server_name localhost;" > /etc/nginx/sites-enabled/default

echo "ssl_certificate     $CERTS_;
    ssl_certificate_key $KEYS_;
    ssl_protocols       TLSv1.2;
" >> /etc/nginx/sites-enabled/default

echo 'location ~ .php$ {
        try_files $uri =404;
        fastcgi_pass wordpress:9000; 
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }
}' >> /etc/nginx/sites-enabled/default

exec "$@"