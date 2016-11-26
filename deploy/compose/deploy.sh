#!/bin/sh

TCP_DOCKER_HOST=10.0.0.1:2376

docker-compose -H $TCP_DOCKER_HOST -f <DIR>/docker-compose.yml down
docker-compose -H $TCP_DOCKER_HOST -f <DIR>/docker-compose.yml pull
docker-compose -H $TCP_DOCKER_HOST -f <DIR>/docker-compose.yml up -d
