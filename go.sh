#!/bin/bash

export STACK_NETWORK=dev-net
export STACK_SERVICE=account
export STACK_VERSION=0.1
export STACK_REPOSITORY=FPLO-Account

# delete previous version
# note: geen rollback!
docker stack rm $STACK_SERVICE

# init
./init.sh

# prepare
./prepare.sh

# go
docker stack deploy -c docker-compose.yml $STACK_SERVICE
