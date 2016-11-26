#!/bin/sh

TCP_DOCKER_HOST=10.0.0.1:2376
PROJECT_NAME=mysite
DIR=<DIR>
CHECK=$(docker-compose -H $TCP_DOCKER_HOST -p ${PROJECT_NAME}_blue -f ${DIR}/docker-compose-blue.yml ps | grep Up)

docker -H $TCP_DOCKER_HOST pull 10.0.0.0:5000/mysite_app

if [ "$CHECK" ]; then
    docker-compose -H $TCP_DOCKER_HOST -p ${PROJECT_NAME}_green -f ${DIR}/docker-compose-green.yml up -d
    sleep 10
    docker-compose -H $TCP_DOCKER_HOST -p ${PROJECT_NAME}_blue -f ${DIR}/docker-compose-blue.yml down
else
    docker-compose -H $TCP_DOCKER_HOST -p ${PROJECT_NAME}_blue -f ${DIR}/docker-compose-blue.yml up -d
    sleep 10
    docker-compose -H $TCP_DOCKER_HOST -p ${PROJECT_NAME}_green -f ${DIR}/docker-compose-green.yml down
fi
