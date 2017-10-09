# Copyright 2017 - Dechain User Group

export NODENAME=`cat /root/NODENAME`

export NODE_ENV="private"
export RPC_HOST="geth-devchain"
export RPC_PORT=8545
export LISTENING_PORT="10000"
export INSTANCE_NAME="${NODENAME}_node"
export CONTACT_DETAILS=""
export WS_SERVER="ws://factory.shinit.net:15000"
export WS_SECRET="20170420devchain"
export VERBOSITY=2

node /root/eth-net-intelligence-api/app.js
