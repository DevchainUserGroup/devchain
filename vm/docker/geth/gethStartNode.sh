#!/bin/bash
source env.sh
export NETWORK_DIR='/network'
export NODE_PORT=10000
export NODE_IP='0.0.0.0'    # your local address you want to bind on
export NODE_PORT_RPC=10001  # your local port for RPC
export NETWORK_IDS=(2017040499 2017042099)
export NETWORK_ID_=${NETWORK_IDS[0]}
export ENODE='enode://56b1d55fa3a314a053f12258990f4477533b7b37602681578d1220c56db05505a7af23cec0004c85ecda4f096f1b2f19cccd54159d8623c072dbfb8bf6b30203@195.154.221.20:10000'

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
./geth --etherbase 0 --datadir=$NETWORK_DIR/$NODE_NAME --port=$NODE_PORT --rpc --rpcapi="admin,eth,miner,eth,web3,personal,txpool" --rpcaddr=$NODE_IP --rpcport=$NODE_PORT_RPC --ipcdisable --networkid=$NETWORK_ID_ --identity=$NODE_NAME --nodiscover --mine --minerthreads=2  --bootnodes $ENODE
