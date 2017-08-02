# Copyright 2017 - Dechain User Group
# Ethereum Smart-Contracts polygon

FROM ethereum/solc:0.4.14
LABEL name=eth-polygon

RUN apk add --update bash zsh vim emacs-nox less tree sudo tmux curl tig \
        nodejs yarn git openssl \
        make
RUN adduser -D node  && echo "node:node" | chpasswd && adduser node wheel \
	 && echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER node
RUN mkdir /home/node/npm-global \
    $$ yarn config set prefix /home/node/npm-global \
    && ln -s /projects /home/node/projects
#    && npm config set prefix /home/node/npm-global \
ENV PATH="/home/node/npm-global/bin:${PATH}"
WORKDIR /home/node

RUN yarn global add ethereumjs-testrpc@4.0.1 truffle@3.4.6


COPY ./.inputrc ./.bashrc /home/node/

EXPOSE 8545
ENTRYPOINT ["/bin/bash"]
