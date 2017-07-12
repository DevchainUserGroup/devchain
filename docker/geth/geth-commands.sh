telnet factory.shinit.net 15000

geth attach 'http://127.0.0.1:10001'
ledit geth attach 'http://127.0.0.1:10001'


admin.addPeer("enode://32571cbf29863ecde4ee89e49d8c88cd4baec13ef5937c54cf06403ecf9e45869c439546ef3d2eb5391b8c42541430c2025b8269ad86fdd56607cbf905afc1bb@195.154.221.20:10000")

admin.peers

geth attach 'http://127.0.0.1:10001'

personal.listAccounts
personal.listWallets


### using testnet
geth --testnet --cache 512 --datadir network-testnet console


### quick dev start
geth --dev --datadir ./network-dev console


## unlock account to provide access to the wallet
personal.unlockAccount(eth.coinbase)


## set default account to make operations:
eth.defaultAccount = eth.coinbase
