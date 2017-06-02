#!/bin/bash
# Copyright 2017 - Dechain User Group
source env.sh
export NODE_PORT=10000               # Network listening port (default: 30303)
export NODE_IP='0.0.0.0'             # your local address you want to bind on
export NODE_PORT_RPC=$GETH_RPC_PORT  # your local port for RPC, default=8545
export NETWORK_IDS=(2017042099)
export NETWORK_ID_=${NETWORK_IDS[0]}

if [ -z $network_id ]
then
    echo "Use default network_id"
elif ! [[ ${network_id}  =~ ^[0-9]+$ ]]
then
    echo "Wrong parameter format for network_id: \"${network_id}\""
    echo "Integer expression expected"
    exit 1
elif [ ${network_id} -eq 1 ] || [ ${network_id} -eq 2 ]
then
    NETWORK_ID_=${NETWORK_IDS[${network_id}-1]}
else
    echo "Wrong parameter network_id: \"${network_id}\""
    echo "Available network_id:"
    echo "1 > ${NETWORK_IDS[0]}"
    echo "2 > ${NETWORK_IDS[1]}"
    exit 1
fi

echo "Network_id: ${NETWORK_ID_}"

echo "Starting Geth..."
# we are using static-nodes.json (set up in gethInitNode.sh)
#    --bootnodes $ENODE
geth --etherbase 0 --datadir=$DATA_DIR --port=$NODE_PORT \
     --rpc --rpcapi="admin,db,eth,miner,net,web3,personal,txpool" --rpcaddr=$NODE_IP --rpcport=$NODE_PORT_RPC \
     --ipcdisable --networkid=$NETWORK_ID_ --identity=$NODE_NAME --nodiscover --minerthreads=2 \
     --fast --mine
