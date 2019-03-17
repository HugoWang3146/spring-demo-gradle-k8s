#!/usr/bin/env bash

set -eux

host_ip=`../get_host_ip.sh`

minikube delete || true

minikube start --vm-driver kvm2

scp -i $(minikube ssh-key) certs/domain.crt docker@$(minikube ip):/home/docker

minikube ssh << EOF

echo "${host_ip} docker-registry.local" | sudo tee --append /etc/hosts

sudo mkdir -p /etc/docker/certs.d/docker-registry.local:5000

sudo cp /home/docker/domain.crt /etc/docker/certs.d/docker-registry.local:5000/ca.crt

sudo systemctl restart docker

curl -X GET https://docker-registry.local:5000/v2/_catalog --cacert /etc/docker/certs.d/docker-registry.local\:5000/ca.crt

exit

EOF