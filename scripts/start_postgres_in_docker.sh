#!/usr/bin/env bash

set -eux

docker rm -f postgres || true

docker run \
    -d \
    -p 5432:5432 \
    --name postgres \
    -e POSTGRES_PASSWORD=password \
    postgres:11