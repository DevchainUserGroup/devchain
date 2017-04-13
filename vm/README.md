
## Description

The environment creates a virtualbox VM using vagrant and run a docker

### To build the environment

1. Install [Vagrant](https://www.vagrantup.com/downloads)

2. Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

3. Checkout this repository
> git clone https://github.com/sirhill/devchain

4. Build the VM
> cd devchain/vm
> vagrant up

**Speed up :** For *Hands On* You may want to copy locally the ubuntu box (274Mo) in ~\.vagrant.d\boxes

5. Connect to the VM
> vagrant ssh

6. Usefull docker command

*List docker image*
> sudo docker image list

*List docker container*
> sudo docker container list

*Start Geth docker*
> sudo docker run geth-container

*Connect to the truffle docker container with sh*
> sudo docker run -it truffle-container busybox sh

*Connect to a docker with sh *
> sudo docker exec -i -t <docker_id> sh

7. Usefull truffle command

*Init a project*
> truffle init

*Run test*
> truffle test

*Serve file content"
> truffle serve
