#!/bin/bash

cwd /home/pi
mkdir .ssh
chmod 600 .ssh

curl -o curl -LJO -o .ssh/authorized_keys.1  https://raw.githubusercontent.com/Scott-Evers/raspbian_build/basic/authorized_keys