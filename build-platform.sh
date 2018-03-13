#!/bin/bash

wget -qO - https://openresty.org/package/pubkey.gpg | sudo apt-key add -

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main"
sudo apt-get update
sudo apt-get install -y openresty awscli