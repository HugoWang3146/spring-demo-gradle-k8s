#!/usr/bin/env bash

set -eux

LOG_PATH='/var/log/spring-boot-demo'

docker rm -f spring-boot-demo || true

docker run \
    -d \
    -p 8080:8080 \
    --name spring-boot-demo \
    --mount type=bind,source=${LOG_PATH},target=${LOG_PATH} \
    docker-registry.local:5000/spring-boot-demo