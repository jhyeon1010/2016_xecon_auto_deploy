#!/bin/sh

TCP_DOCKER_HOST=10.0.0.1:2376
DIR=<DIR>
CHECK=$(docker-compose -H $TCP_DOCKER_HOST -f ${DIR}/docker-compose.yml ps | grep blue | grep Up)

if [ “$CHECK” ]; then
    docker-compose -H $TCP_DOCKER_HOST -f ${DIR}/docker-compose.yml up -d app_green
    docker-compose -H $TCP_DOCKER_HOST -f ${DIR}/docker-compose.yml stop app_blue
else
    docker-compose -H $TCP_DOCKER_HOST -f ${DIR}/docker-compose.yml up -d app_blue
    docker-compose -H $TCP_DOCKER_HOST -f ${DIR}/docker-compose.yml stop app_green
fi
