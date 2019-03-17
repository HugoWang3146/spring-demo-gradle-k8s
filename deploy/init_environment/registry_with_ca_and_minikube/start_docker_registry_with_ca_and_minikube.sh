#!/usr/bin/env bash

set -eux

host_ip=`../get_host_ip.sh`

docker rm -f registry || true

docker run -d \
  --restart=always \
  --name registry \
  -v "$(pwd)"/certs:/certs \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
  -p 5000:443 \
  registry:2

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