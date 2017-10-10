
# Devchain User Group Environment Repository

This page describes the steps for the installation on Linux

### Linux

Once you have your environment follow
You don't need to install Vagrant, since all setups is based on Docker.

1. Install dependencies: `docker`, `make` `docker-compose`
1. Add yourself to docker group:

		groupadd docker && sudo gpasswd -a ${USER} docker && sudo systemctl restart docker

	To make an effect of the above you probably need to **re-login**.

## License

Copyright 2017 - Dechain User Group
Apache License (./LICENSE.txt)[./LICENSE.txt]
