build-geth:
	@cd vm/docker/geth; docker build -t geth-devchain -f gethDockerfile .

run-geth:
	@docker run -v share:/share geth-devchain

bash-geth:
	@docker exec -it `docker ps | grep " geth-devchain " | awk '{print $$1}'` /bin/bash

clean-container:
	@docker rm `docker ps --no-trunc -aq`
