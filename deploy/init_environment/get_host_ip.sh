#!/usr/bin/env sh

ifconfig | sed -En 's/127.0.0.1//;s/172.17//;s/192.168//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'

