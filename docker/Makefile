# Copyright 2017 - Dechain User Group
### Geth ###

build-geth:
	@cd geth; docker build -t geth-devchain -f Dockerfile .

# runs the container with a default entrypoint: a service mananger
run-geth:
	@docker run -v ${PWD}/../projects:/projects -p 10001:10001 -it geth-devchain

stop-geth:
	@docker stop `docker ps | grep " geth-devchain " | awk '{print $$1}'`

# joins the running container
join-geth:
	@docker exec -it --user 1000 `docker ps | grep " geth-devchain " | awk '{print $$1}'` /bin/bash

# runs the container and start bash session (without starting the Ethereum client)
bash-geth:
	@docker run -it -v ${PWD}/../projects:/projects -p 10001:10001 --user 1000 --entrypoint "/bin/bash" geth-devchain


### Truffle ###

build-truffle:
	@cd truffle; docker build -t truffle-devchain -f truffleDockerfile .

# runs the container and start bash session
testrpc-truffle:
	@docker run -it -v ${PWD}/../projects:/projects -p 8545:8545 --user 1000 --entrypoint "/home/node/npm-global/bin/testrpc" truffle-devchain -m 'bonus salon bracket farm foot face stomach'

# runs the container and start bash session
bash-truffle:
	@docker run -it -v ${PWD}/../projects:/projects -p 8545:8545 --user 1000 truffle-devchain

join-truffle:
	@docker exec -it `docker ps | grep " truffle-devchain " | awk '{print $$1}'` /bin/bash

stop-truffle:
	@docker stop `docker ps | grep " truffle-devchain " | awk '{print $$1}'`


### cleanup ###

clean-container:
	@docker rm `docker ps --no-trunc -aq`

cleanup-docker:
	@docker ps -f status=exited -q | xargs -r docker rm
	@docker images -f dangling=true -q | xargs -r docker rmi
