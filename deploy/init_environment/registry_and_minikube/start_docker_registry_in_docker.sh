#!/usr/bin/env bash

set -eux

docker rm -f registry || true

docker run -d -p 5000:5000 --name registry registry:2
