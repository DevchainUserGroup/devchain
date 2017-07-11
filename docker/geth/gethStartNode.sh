#!/bin/bash
# Copyright 2017 - Dechain User Group
source env.sh
export NODE_PORT=10000               # Network listening port (default: 30303)
export NODE_IP='0.0.0.0'             # your local address you want to bind on
export NODE_PORT_RPC=$GETH_RPC_PORT  # your local port for RPC, default=8545
export NETWORK_IDS=(2017042099)
export NETWORK_ID_=${NETWORK_IDS[0]}


## check and setup the primary account

ETHERBASE_PWD=$DATA_DIR/etherbase_pwd.txt
mkdir -p /projects/ethereum

if [ ! -d $DATA_DIR ]; then
	echo "Initialisation network $DATA_DIR data dir"
	ln -s /projects/ethereum $DATA_DIR
	geth --datadir $DATA_DIR init ./gethGenesisBlock.json
	cat <<EOF >$DATA_DIR/static-nodes.json
[
    "enode://32571cbf29863ecde4ee89e49d8c88cd4baec13ef5937c54cf06403ecf9e45869c439546ef3d2eb5391b8c42541430c2025b8269ad86fdd56607cbf905afc1bb@195.154.221.20:10000"
]
EOF
	echo "Creating an account for mining"
	echo -e "password" > $ETHERBASE_PWD
	geth --datadir $DATA_DIR --password $ETHERBASE_PWD account new
else
	echo "reusing network $DATA_DIR"
fi


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
     --networkid=$NETWORK_ID_ --identity=$NODE_NAME --nodiscover --minerthreads=2 \
     --rpccorsdomain remix.ethereum.org,localhost \
     --ipcpath $DATA_DIR/geth.ipc  \
     --unlock 0 --password $ETHERBASE_PWD \
     --fast --mine
