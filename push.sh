#!/bin/sh

DIR=/PATH/TO/DOCKERFILE

git -C $DIR/www pull
sudo docker build -t 10.0.0.0:5000/mysite_app $DIR
sudo docker push 10.0.0.0:5000/mysite_app
