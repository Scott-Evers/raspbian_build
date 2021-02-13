#!/bin/bash

cwd /home/pi
mkdir .ssh
chmod 600 .ssh

sudo apt update

sudo apt install -y ansible

curl -o .ssh/authorized_keys.1  https://raw.githubusercontent.com/Scott-Evers/raspbian_build/basic/authorized_keys