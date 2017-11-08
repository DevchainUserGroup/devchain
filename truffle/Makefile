.PHONY: setup-dev \
	lint watch-lint


setup-dev:
	@echo "installing DEV dependencies"
	@yarn install
	@echo -e "Done" $(CHECK)

###############################
# linting

lint-sol:
	@solium --dir contracts

lint-js:
	@standard migrations/*.js test/*.js

lint: lint-sol lint-js



###############################
# test

run-testrpc:
	@ps -a -o args | grep "^node .*testrpc.*8544" || \
		./node_modules/.bin/testrpc --port 8544 --network-id 9 --gasLimit 0x669f97

test:
	@./node_modules/.bin/truffle test

compile:
	@./node_modules/.bin/truffle compile

deploy:
	@./node_modules/.bin/truffle deploy
