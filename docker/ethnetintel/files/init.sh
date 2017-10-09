# Copyright 2017 - Dechain User Group

cd /root
echo "Setting up eth net intelligence api"
wget http://github.com/cubedro/eth-net-intelligence-api/archive/master.zip
unzip master.zip
mv eth-net-intelligence-api-master eth-net-intelligence-api
cd eth-net-intelligence-api
npm install
