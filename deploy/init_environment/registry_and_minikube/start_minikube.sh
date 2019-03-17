#!/usr/bin/env bash

set -eux

host_ip=`../get_host_ip.sh`

minikube delete || true

minikube start --vm-driver kvm2 --insecure-registry docker-registry.local:5000

minikube ssh << EOF

echo "${host_ip} docker-registry.local" | sudo tee --append /etc/hosts

curl -X GET docker-registry.local:5000/v2/_catalog

exit

EOF
