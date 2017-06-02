#!/bin/bash
# Copyright 2017 - Dechain User Group

source /home/eth/env.sh

export NODE_ENV="private"
export RPC_HOST="localhost"
export RPC_PORT=$GETH_RPC_PORT
export LISTENING_PORT="10000"
export INSTANCE_NAME="${NODE_NAME}_node"
export CONTACT_DETAILS=""
export WS_SERVER="ws://factory.shinit.net:15000"
export WS_SECRET="20170420devchain"
export VERBOSITY=2

node /home/eth/eth-net-intelligence-api/app.js
