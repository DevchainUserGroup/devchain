
# Devchain User Group Environment Repository

This package provides docker image and scripts to run private Ethereum blockchain.

## Slack

Please join our slack group: [geneva-devchain](https://geneva-devchain.slack.com).

### Pre-install Windows / OSX

Please follow the [Windows / MacOS pre installation](WindowsMacOS_install.md)

### Pre-install Linux

Please follow the [Linux pre installation](Linux_install.md)

### Setup

All the docker entry commands are inside the [Makefile](https://github.com/DevchainUserGroup/environment/docker/Makefile). Please make familiar with the content of this file.

1. Create a NODENAME file - [./docker/ethnetintel/files/NODENAME](./docker/ethnetintel/files/NODENAME) with your username:

		cd docker/ethnetintel/files
		echo "my-name" > NODENAME

1. Build Images:

		cd docker
		make geth-build eth-polygon-build

1. Run the node:

		make geth-run

1. Run the eth-net-intelligence-api with docker. Attention: this will start separate `docker_geth-devchain` container in a background - so you shouldn't run normal geth.

	docker-compose up --build ethnetintel-devchain


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
