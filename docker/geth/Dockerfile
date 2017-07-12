# Copyright 2017 - Dechain User Group

FROM ethereum/client-go:v1.6.5
LABEL name=geth

# This is to allow runit stop gracefully
STOPSIGNAL HUP
ENTRYPOINT runsvdir /etc/service & tail -F /home/eth/log/geth/current

RUN ln -s /usr/local/bin/geth /usr/bin/
# configure container
RUN apk add --update bash zsh vim emacs-nox shadow runit less sudo \
	nodejs git openssl  # for intelligence api
RUN adduser -D eth  && passwd -d eth && adduser eth wheel \
	&& echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

COPY ./.inputrc ./.bashrc /root/

USER eth
WORKDIR /home/eth
# NOTE: you have to create NODENAME file
COPY ./NODENAME /home/eth/
COPY ./geth*json ./*.sh ./.inputrc ./.bashrc /home/eth/

RUN mkdir -p log/geth log/ethnetintel
RUN bash ./init.sh

USER root
RUN chown -R eth:users /home/eth
# Add services runit scripts
COPY service /etc/service

EXPOSE 10000 10001 10002
