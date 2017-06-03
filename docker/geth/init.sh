#!/bin/bash
# Copyright 2017 - Dechain User Group
source env.sh
ETHERBASE=$DATA_DIR/etherbase.txt
export

if [ "x$NODE_NAME" == "x$HOSTNAME" ]; then
  echo "Setting node name to $HOSTNAME"
  mv env.sh env.sh.bak
  sed -e "s/\$HOSTNAME/$HOSTNAME/" env.sh.bak > env.sh
fi

echo "Initialisation network $NETWORK_DIR"
if [ -d $DATA_DIR ]; then
  rm -rf $DATA_DIR
fi

geth --datadir $DATA_DIR init ./gethGenesisBlock.json

cat <<EOF >$DATA_DIR/static-nodes.json
[
    "enode://32571cbf29863ecde4ee89e49d8c88cd4baec13ef5937c54cf06403ecf9e45869c439546ef3d2eb5391b8c42541430c2025b8269ad86fdd56607cbf905afc1bb@195.154.221.20:10000"
]
EOF

echo "Creating an etherbase for mining"
echo -e "password" > $ETHERBASE
geth --datadir $DATA_DIR --password $ETHERBASE account new

echo "Setting up eth net intelligence api"
wget http://github.com/cubedro/eth-net-intelligence-api/archive/master.zip
unzip master.zip
mv eth-net-intelligence-api-master eth-net-intelligence-api
cd eth-net-intelligence-api
npm install
