#!/usr/bin/env bash

set -eux

K8S_NAMESPACE='spring-boot-demo'

config_files=('postgres_deployment.yml' 'postgres_svc.yml' 'spring_boot_demo_deployment.yml' 'spring_boot_demo_svc.yml' 'ingress_nginx_controller_rbac.yml' 'ingress_nginx_controller.yml' 'ingress_nginx_svc.yml' 'ingress_nginx.yml')

kubectl delete namespace ${K8S_NAMESPACE} || true

kubectl create namespace ${K8S_NAMESPACE}
#
#kubectl apply -n ${K8S_NAMESPACE} -f postgres_deployment.yml
#
#kubectl apply -n ${K8S_NAMESPACE} -f postgres_svc.yml
#
#kubectl apply -n ${K8S_NAMESPACE} -f spring_boot_demo_deployment.yml
#
#kubectl apply -n ${K8S_NAMESPACE} -f spring_boot_demo_svc.yml

for config in "${config_files[@]}"; do
  kubectl apply -n ${K8S_NAMESPACE} -f ${config}
done