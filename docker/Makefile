# Copyright 2017 - Dechain User Group

geth-build:
	@mkdir -p ../projects ../eth-data
	@docker-compose build geth-devchain

# runs the container with a default entrypoint: a service mananger
geth-run:
	@docker-compose up geth-devchain

geth-stop:
	@docker-compose stop geth-devchain
#	@docker stop `docker ps | grep " geth-devchain " | awk '{print $$1}'`

# joins the running container
geth-join:
	@docker-compose exec geth-devchain bash

# runs the container and start bash session (without starting the Ethereum client)
geth-bash:
	@docker-compose run --entrypoint bash geth-devchain


### Truffle ###

eth-polygon-build:
	@mkdir -p ../projects
	@docker-compose build eth-polygon

# runs the container and starts testrpc
eth-polygon-testrpc:
	@docker-compose run --no-deps --entrypoint testrpc eth-polygon -m 'bonus salon bracket farm foot face stomach'

# runs the container and start a new bash session
eth-polygon-bash:
	@docker-compose run --no-deps --entrypoint bash eth-polygon

# use it to join currently running container in a new bash session
eth-polygon-join:
	@docker exec -it `docker ps | grep "eth-polygon" | awk '{print $$1}'` /bin/bash

eth-polygon-stop:
	@docker-compose stop eth-polygon
	@docker stop `docker ps | grep "eth-polygon" | awk '{print $$1}'`


### cleanup ###

clean-container:
	@docker ps -f status=exited -q --no-trunc | xargs -r docker rm

cleanup-images:
	@docker images -f dangling=true -q | xargs -r docker rmi
