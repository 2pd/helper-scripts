#!/usr/bin/env bash

set -e

echo "=== verifing docker app ==="
if ! [ -x "$(command -v docker)" ]; then
    echo "Docker is not installed" >&2
    exit 1
fi

echo "=== remove dangling voluems ==="
if [ "$(docker volume ls -qf dangling=true)" ]; then
    docker volume rm $(docker volume ls -qf dangling=true)
fi

echo "=== remove exited container ==="
if [ "$(docker ps -qa --no-trunc --filter "status=exited")" ]; then
    docker rm $(docker ps -qa --no-trunc --filter "status=exited")
fi

echo "=== remove dangling images ==="
if [ "$(docker images --filter "dangling=true" -q --no-trunc)" ]; then
    docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
fi

echo "=== remove unused networks ==="
docker network prune -f
