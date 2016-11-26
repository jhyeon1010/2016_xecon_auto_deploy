#!/bin/sh

ssh {USER}@{SERVICE_SERVER_IP} <<EOF
    sudo docker pull 10.0.0.0:5000/mysite_app

    sudo docker stop mysite_nginx_container
    sudo docker stop mysite_app_container
    sudo docker rm mysite_nginx_container
    sudo docker rm mysite_app_container

    sudo docker run -d --name mysite_app_container 10.0.0.0:5000/mysite_app
    sudo docker run -d --name mysite_nginx_container -p 80:80 -p 443:443 --volumes-from mysite_app_container -v <DIR>/sites-available/mysite:/etc/nginx/sites-available/default jhyeon1010/nginx

    exit
EOF
