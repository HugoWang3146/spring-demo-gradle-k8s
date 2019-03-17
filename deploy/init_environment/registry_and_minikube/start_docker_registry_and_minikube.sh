#!/usr/bin/env bash

set -eux

./start_docker_registry_in_docker.sh

./start_minikube.sh