#! /usr/bin/env bash

apt-get -y install sudo

# Set up password-less sudo for user debian
echo 'debian ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/debian
chmod 440 /etc/sudoers.d/debian

# no tty
echo "Defaults !requiretty" >> /etc/sudoers
