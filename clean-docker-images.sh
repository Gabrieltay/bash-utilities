#!/bin/bash
# Delete all containers
docker rm -f $(docker ps -a -q)
# Delete all images
docker rmi -f $(docker images -q)
# Removes all stopped containers and volumes
docker system prune -f --volumes
