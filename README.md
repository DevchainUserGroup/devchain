
# Devchain User Group Environment Repository

This package provides docker image and scripts to run private Ethereum blockchain.

## Slack

Please join our slack group: [geneva-devchain](https://geneva-devchain.slack.com).

### Pre-install Windows / OSX

Please follow the [Windows / MacOS pre installation](WindowsMacOS_install.md)

All the docker entry commands are inside the [Makefile](https://github.com/DevchainUserGroup/environment/docker/Makefile). Please make familiar with the content of this file.

If you are Linux user then please skip the Vagrant installation part. Go directly to Docker.


### Pre-install Linux

Please follow the [Linux pre installation](Linux_install.md)

### Setup

All the docker entry commands are inside the [Makefile](https://github.com/DevchainUserGroup/environment/docker/Makefile). Please make familiar with the content of this file.

1. Create a NODENAME file - [./docker/ethnetintel/files/NODENAME](./docker/ethnetintel/files/NODENAME) with your username:

		cd <this repo directory>/docker  # in vagrant this is ~/docker
		echo "my-name" > ethnetintel/files/NODENAME

1. Build Images:

		cd docker
		make geth-build eth-polygon-build

1. Run a Devchain's node.
   This can be achieve either ways:
   + Geth stand alone

		make geth-run

   + Run Geth with eth-net-intelligence-api. In this case you don't run the `geth-devchain` cointainer because `ethnetintel-devchain` will start a new one for you.

		docker-compose up --build ethnetintel-devchain


For those who don't want to install npm modules for development (truffl, testrpc...) we provide the `eth-polygon` container. It will start the `testrpc` on the 8544 port. Please look at the `Makefile` to find more how to access the polygon container.

## Useful docker commands

+ List docker image

	sudo docker image list

+ List docker container

	sudo docker container list



## Usefull geth command

+ Find how to manage your wallet at the [Ethereum Wiki](https://github.com/ethereum/go-ethereum/wiki/Managing-your-accounts)


## Usefull truffle command

+ Init a project

		truffle init

+ Run test

		truffle test

+ Serve file content

		truffle serve


## Intelligence API

[http://factory.shinit.net:15000](http://factory.shinit.net:15000)


## License

Copyright 2017 - Dechain User Group
Apache License (./LICENSE.txt)[./LICENSE.txt]
