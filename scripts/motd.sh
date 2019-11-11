#! /usr/bin/env bash

# Remove the dynamic and static parts of the motd.

rm /etc/update-motd.d/10-uname
echo -n > /etc/motd
