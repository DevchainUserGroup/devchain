#!/bin/bash
export NETWORK_DIR='/network'
export NODE_NAME=main_node
export NODE_PORT=10000
export NODE_IP='0.0.0.0'
export NODE_PORT_RPC=10001

echo "Starting Geth..."
./geth --etherbase 0 --datadir=$NETWORK_DIR/$NODE_NAME --port=$NODE_PORT --rpc --rpcapi="admin,eth,miner,eth,web3,personal,txpool" --rpcaddr=$NODE_IP --rpcport=$NODE_PORT_RPC --ipcdisable --networkid=2017040499 --identity=$NODE_NAME --nodiscover --mine --minerthreads=2
