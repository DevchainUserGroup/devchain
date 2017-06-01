#!/bin/bash
set vx

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
sudo apt-get install -y docker-engine make

# 534Mb extra option - recommended
# sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual

DOCKER_RUNNING=`sudo systemctl status docker | grep 'Main PID'`
if [ "x$DOCKER_RUNNING" != "x" ];
then
  echo "Docker is installed and running"
else
  echo "Error while installing Docker"
  sudo systemctl status docker
  exit -1
fi

sudo usermod -a -G docker ubuntu

ENVIRONMENT_DIR="/home/ubuntu/share/environment/docker"
if [ -d $ENVIRONMENT_DIR ];
then
  echo "Share directory is available in ~/share"
else
  echo "Error: no share directory available '$ENVIRONMENT_DIR'"
  exit -1
fi

echo "Creating Geth image"
cd $ENVIRONMENT_DIR
make build-geth

echo "Creating Truffle image"
#make build-truffle
