### Geth ###

build-geth:
	@cd geth; docker build -t geth-devchain -f gethDockerfile .

# runs the container with a default entrypoint: a service mananger
run-geth:
	@docker run -v share:/share geth-devchain

stop-geth:
	@docker stop `docker ps | grep " geth-devchain " | awk '{print $$1}'`

# joins the running container
join-geth:
	@docker exec -it `docker ps | grep " geth-devchain " | awk '{print $$1}'` /bin/bash

# runs the container and start bash session (without starting the Ethereum client)
bash-geth:
	@docker run -it -v ${PWD}/../projects:/projects --user 1000 --entrypoint "/bin/bash" geth-devchain


### Truffle ###

build-truffle:
	@cd truffle; docker build -t truffle-devchain -f truffleDockerfile .

bash-truffle:
	@docker run -it -v ${PWD}/../projects:/projects -p 8080:8080 --user 1000 --entrypoint "/bin/bash" truffle-devchain

clean-container:
	@docker rm `docker ps --no-trunc -aq`

clean-untag-images:
	@docker rmi $(docker images | grep "^<none>" | awk "{print $$3}")
