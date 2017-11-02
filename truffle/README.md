# Truffle installation instructions

Truffle is a development environment, testing framework and asset pipeline for Ethereum, aiming to make life as an Ethereum developer easier.

## Setup

Requirements:

* yarn>=1.1 (recommended) or npm >= 5.0
* node >= 8.0

Below we will use `yarn` but if you prefer you can adapt to use `npm`

```
git clone https://github.com/DevchainUserGroup/environment.git
cd environment/truffle
yarn install
```

Next we need to add executable to our `PATH`. There are 2 ways to do it. Below, the `<environment-repo>` is a placeholder for path where you cloned this repository.

1. Add project bin to your PATH by editing your `.profile` (assuming you are sourcing it).

		export <environment-repo>/truffle/node_modules/.bin

2. Add links to the executables into a directory which is in your PATH. Below I assume `~/bin` is in your PATH. You can choose another directory which is in your PATH (eg `/usr/local/bin` - but this one will probably require a root access)

		cd ~/bin
		for f in solium standard testrpc truffle; do ln -s <environment-repo>/truffle/node_modules/.bin/$f ./; done



### Using docker

For those who don't want to install npm modules for development (truffle, testrpc...) we provide the `eth-polygon` container. It will start the `testrpc` on the 8544 port. Please look at the `Makefile` to find more how to access the polygon container.


## Starting a new project

1. Create a new directory
2. Run `truffle init`
3. link the `Makefile` to that directory
4. Run `make run-testrpc`
