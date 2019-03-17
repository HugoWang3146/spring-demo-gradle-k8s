#!/usr/bin/env sh

set -eux

cd `dirname $0`
WORK_DIR=`pwd`

LOG_PATH='/var/log/spring-boot-demo'

mkdir -p ${LOG_PATH}

java \
  -Xms512m \
  -Xdebug \
  -Dspring.profiles.active=product \
  -cp /app/resources:/app/classes:/app/libs/* \
  indi.wh.Application