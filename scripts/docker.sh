#! /usr/bin/env bash

apt-get -y install \
  apt-transport-https \
  ca-certificates \
  gnupg2 \
  software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/debian \
  $(lsb_release -cs) \
  stable"

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

groupadd docker
usermod -aG docker debian

apt-get install -y docker-compose
