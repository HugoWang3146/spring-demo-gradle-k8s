#!/usr/bin/env bash

set -eux

./start_postgres_in_docker.sh

./start_redis_in_docker.sh