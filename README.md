
# Devchain User Group Environment Repository

This package provides docker image and scripts to run private Ethereum blockchain.

## Slack

Pleas join our slack group: [geneva-devchain](https://geneva-devchain.slack.com).

## Setup

All the docker entry commands are inside the [Makefile](https://github.com/DevchainUserGroup/environment/docker/Makefile). Please make familiar with the content of this file.

### Windows / OSX

For non Linux systems we use Vagrant to provide  full environment to operate Docker containers.
Vagrant will automatically setup a virtual machine for you.

1. Install [Vagrant](https://www.vagrantup.com/downloads)
1. Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
1. And for Windows user install [Cmder](http://cmder.net/) > Downloads full

1. In your terminal (or cmder) go on the Devchain dedicated folder. Checkout this repository (it's possible your MacBook ask you to install Xcode, just do it)

		git clone https://github.com/DevchainUserGroup/environment.git

1. Configure your geth node name, edit [./environment/docker/geth/env.sh](./docker/geth/env.sh)

1. Check you have 10 Go spaces on your drive.

1. Run the Vagrant image:

		cd ./environment/vagrant
		vagrant up

1. Connect to the VM

		vagrant ssh


#### Update VM Vagrant image

1. Remove the VM Vagrant image:

    1. Connect to the VirtualBox Manager
    1. Select the devchain-vm VM
    1. Go to menu "Machine > Close > Power Off"
    1. Go to menu "Machine > Remove > Delete all files"

1. Incorporates changes from the DevchainUserGroup repository

		git pull https://github.com/DevchainUserGroup/environment.git

1. Check you have 10 Go spaces on your drive.

1. Run the Vagrant image:

		cd ./environment/vagrant
		vagrant up



### Linux

Once you have your environment follow
You don't need to install Vagrant, since all setups is based on Docker.

1. Install dependencies: `docker`, `make` `docker-compose`
1. Add yourself to docker group:

		groupadd docker && sudo gpasswd -a ${USER} docker && sudo systemctl restart docker

1. Create a NODENAME file - [./docker/ethnetintel/files/NODENAME](./docker/ethnetintel/files/NODENAME) with your username:

		cd <your-project>/ethnetintel/files
		echo "my-name" > NODENAME

1. Build Images:

		make geth-build eth-polygon-build

1. Run the node:

		make geth-run




## Useful docker commands

+ List docker image

	sudo docker image list

+ List docker container

	sudo docker container list

+ Start Geth docker (with default network id)

		sudo docker run geth-container

+ Start Geth docker with specific network id

		sudo docker run -e "network_id=2" geth-container

	Available network ids:

		1: 2017040499 (default)
		2: 2017042099

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

(http://factory.shinit.net:15000)[http://factory.shinit.net:15000]


## License

Copyright 2017 - Dechain User Group
Apache License (./LICENSE.txt)[./LICENSE.txt]
