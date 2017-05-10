#!/bin/bash
source env.sh
export NETWORK_DIR="/network/$NODE_NAME"
export ETHERBASE=$NETWORK_DIR/etherbase.txt

echo "Initialisation network $NETWORK_DIR"
if [ -d $NETWORK_DIR ];
then
  rm -rf $NETWORK_DIR
fi

./geth --datadir $NETWORK_DIR init ./gethGenesisBlock.json

cat <<EOF >$NETWORK_DIR/static-nodes.json
[
    "enode://32571cbf29863ecde4ee89e49d8c88cd4baec13ef5937c54cf06403ecf9e45869c439546ef3d2eb5391b8c42541430c2025b8269ad86fdd56607cbf905afc1bb@195.154.221.20:10000"
]
EOF


echo "Creating an etherbase for mining"
echo -e "password" > $ETHERBASE
./geth --datadir $NETWORK_DIR --password $ETHERBASE account new
