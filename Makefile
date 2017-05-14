build-geth:
	@cd vm/docker/geth; docker build -t geth-devchain -f gethDockerfile .

# runs the container with a default entrypoint
run-geth:
	@docker run -v share:/share geth-devchain

# joins the running container
join-geth:
	@docker exec -it `docker ps | grep " geth-devchain " | awk '{print $$1}'` /bin/bash

# runs the container and start bash session (without starting the Ethereum client)
bash-geth:
	@docker run -it -v share:/share --entrypoint "/bin/bash" geth-devchain


clean-container:
	@docker rm `docker ps --no-trunc -aq`
