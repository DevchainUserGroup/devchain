## Description

Contains geth environment files

### To build manualy the environment

1. Connect to the VM
> vagrant ssh

2. Go to the geth environment files folder 
> cd /home/ubuntu/geth-container

3. Run docker build command
> sudo docker build -t geth-container -f gethDockerfile .
