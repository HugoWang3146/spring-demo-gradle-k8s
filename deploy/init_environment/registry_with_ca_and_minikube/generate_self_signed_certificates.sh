#!/usr/bin/env bash

set -eux

#https://docs.docker.com/registry/insecure/

# common name: docker-registry.local

openssl req \
  -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key \
  -x509 -days 365 -out certs/domain.crt