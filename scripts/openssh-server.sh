#! /usr/bin/env bash

# OpenSSH is already installed with preseed.cfg.
# apt-get -y install openssh-server

echo "UseDNS no" >> /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config
echo "PrintLastLog no" >> /etc/ssh/sshd_config
