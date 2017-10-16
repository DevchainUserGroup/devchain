
# Devchain User Group Environment Repository

This page describes the steps for the installation on Windows / OSX

### Windows / OSX

For non Linux systems we use Vagrant to provide  full environment to operate Docker containers.
Vagrant will automatically setup a virtual machine for you.

1. Install [Vagrant](https://www.vagrantup.com/downloads)
1. Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
1. And for Windows user install [Cmder](http://cmder.net/) > Downloads full

1. In your terminal (or cmder) go on the Devchain dedicated folder. Checkout this repository (it's possible your MacBook ask you to install Xcode, just do it)

		git clone https://github.com/DevchainUserGroup/environment.git

1. Check you have 10 Go spaces on your drive.

1. Run the Vagrant image:

		cd ./environment/vagrant
		vagrant up

1. Connect to the VM

		vagrant ssh


#### Update VM Vagrant image

1. Remove the VM Vagrant image:

    1. Connect to the VirtualBox Manager
    1. Select the devchain-vm VM
    1. Go to menu "Machine > Close > Power Off"
    1. Go to menu "Machine > Remove > Delete all files"

1. Incorporates changes from the DevchainUserGroup repository

		git pull https://github.com/DevchainUserGroup/environment.git

1. Check you have 10 Go spaces on your drive.

1. Run the Vagrant image:

		cd ./environment/vagrant
		vagrant up

## License

Copyright 2017 - Dechain User Group
Apache License (./LICENSE.txt)[./LICENSE.txt]
