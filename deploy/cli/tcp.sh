#!/bin/sh

TCP_DOCKER_HOST=10.0.0.1:2376

docker -H $TCP_DOCKER_HOST pull 10.0.0.0:5000/mysite_app

docker -H $TCP_DOCKER_HOST stop mysite_nginx_container
docker -H $TCP_DOCKER_HOST stop mysite_app_container
docker -H $TCP_DOCKER_HOST rm mysite_nginx_container
docker -H $TCP_DOCKER_HOST rm mysite_app_container

docker -H $TCP_DOCKER_HOST run -d --name mysite_app_container 10.0.0.0:5000/mysite_app
docker -H $TCP_DOCKER_HOST run -d --name mysite_nginx_container -p 80:80 -p 443:443 --volumes-from mysite_app_container -v <DIR>/sites-available/mysite:/etc/nginx/sites-available/default jhyeon1010/nginx
