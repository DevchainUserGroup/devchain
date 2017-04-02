#!/bin/bash
export NETWORK_DIR="/network/main_node"
export ETHERBASE=$NETWORK_DIR/etherbase.txt

echo "Initialisation network $NETWORK_DIR"
if [ -d $NETWORK_DIR ];
then
  rm -rf $NETWORK_DIR
fi

./geth --datadir $NETWORK_DIR init ./gethGenesisBlock.json

echo "Creating an etherbase for mining"
echo -e "password" > $ETHERBASE
./geth --datadir $NETWORK_DIR --password $ETHERBASE account new

