#!/bin/bash
set vx

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
sudo apt-get install -y docker-engine

DOCKER_RUNNING=`sudo systemctl status docker | grep 'Main PID'`
if [ "x"$DOCKER_RUNNING != "x" ];
then
  echo "Docker is installed and running"
else
  echo "Error while installing Docker"
  sudo systemctl status docker
  exit -1
fi

sudo usermod -aG docker $(whoami)

echo "Creating Geth image"
mkdir geth-container
cp -Rp ~/shared/docker/geth/* .
cd geth-container
sudo docker build -t geth-container -f gethDockerfile .
cd ..

echo "Creating Truffle image"
mkdir truffle-contrainer
cp -Rp ~/shared/docker/truffle/* .
cd truffle-contrainer
sudo docker build -t truffle-container -f truffleDockerfile .
cd ..
