#!/bin/bash
# Copyright 2017 - Dechain User Group
export NODE_PORT=30303               # Network listening port (default: 30303)
export NODE_IP='0.0.0.0'             # your local address you want to bind on


## check and setup the primary account

DATA_DIR="/root/.ethereum"  # the default one
COINBASE_PWD=$DATA_DIR/coinbase_pwd.txt
if [ -z "$NETWORKID" ]; then
	NETWORKID=1337
fi
if [ -n "$MINERTHREADS" ]; then
	MINERTHREADS_OPT="--minerthreads $MINERTHREADS"
	echo "MINERTHREADS: $MINERTHREADS"
fi
echo "NETWORKID=$NETWORKID"
echo "MINERTHREADS=$MINERTHREADS"

if [ ! -d $DATA_DIR ]; then
	echo "WARNING: eth data volume not provided. Creating local DATADIR"
	mkdir -p $DATA_DIR
	# TODO: below the port should be 10001
	cat <<EOF >$DATA_DIR/static-nodes.json
[
    "enode://32571cbf29863ecde4ee89e49d8c88cd4baec13ef5937c54cf06403ecf9e45869c439546ef3d2eb5391b8c42541430c2025b8269ad86fdd56607cbf905afc1bb@195.154.221.20:10000"
]
EOF
fi
if [ ! -f $COINBASE_PWD ]; then
	echo "Creating password file"
	echo -e "password" > $COINBASE_PWD
fi
if [ ! -d $DATA_DIR/geth/chaindata ]; then
	echo "Initialisation network $DATA_DIR data dir"
	## This doesn't work with --dev
	if [ -z "$DEV" ]; then
		sed -i "s/: 1337/: $NETWORKID/" /root/gethGenesisBlock.json
		geth --datadir $DATA_DIR init /root/gethGenesisBlock.json
	fi
	if [ -z "$(ls -A $DATA_DIR/keystore)" ]; then
		echo "Creating coinbase account"
		geth --datadir $DATA_DIR --password $COINBASE_PWD account new
	fi
else
	echo "reusing network $DATA_DIR"
fi


echo "Starting Geth $DEV..."
# we are using static-nodes.json (set up in gethInitNode.sh)
#    --bootnodes $ENODE

geth --datadir=$DATA_DIR --port=$NODE_PORT \
     --rpc --rpcaddr=$NODE_IP --rpcapi="eth,miner,net,web3,personal,txpool" --rpccorsdomain "*"\
     --ws --wsaddr $NODE_IP --wsapi "eth,miner,net,web3,personal,txpool" --wsorigins "*" \
     --networkid $NETWORKID \
     --identity "$NODENAME" \
     --nodiscover --maxpeers 0 \
     --unlock 0 --password $COINBASE_PWD \
     --fast --cache=512 \
     --mine $MINERTHREADS_OPT $DEV

# --dev \
# --verbosity 5
