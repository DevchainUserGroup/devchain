
# Devchain User Group Environmen Repository

This package provides docker image and scripts to run private Ethereum blockchain.

## Setup

All the docker entry commands are inside the [Makefile](https://github.com/DevchainUserGroup/environment/blob/reorganization/Makefile). Please make familiar with the content of this file.

### Windows / OSX

For non Linux systems we use Vagrant to provide  full environment to operate Docker containers.
Vagrant will automatically setup a virtual machine for you.

1. Install [Vagrant](https://www.vagrantup.com/downloads)
1. Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
1. Run the Vagrant image:

		cd vagrant
		vagrant up

1. Connect to the VM

		vagrant ssh



### Linux / Linux VM

Once you have your environment follow
You don't need to install Vagrant, since all setups is based on Docker. All you need to do is to install `docker` and `make`.

1. Configure your geth node name, edit [./docker/geth/env.sh](./docker/geth/env.sh)

2. Build Images:
		make build-geth



### Useful docker commands

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


## Usefull truffle command

+ Init a project

		truffle init

+ Run test

		truffle test

+ Serve file content

		truffle serve


## Intelligence API

(http://factory.shinit.net:15000)[http://factory.shinit.net:15000]
