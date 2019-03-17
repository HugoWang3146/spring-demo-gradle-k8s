#!/usr/bin/env bash

set -eux

docker run \
  -d \
  -p 6379:6379 \
  --name redis \
  redis:5.0.1
