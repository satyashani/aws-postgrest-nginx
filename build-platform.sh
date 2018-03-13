#!/bin/bash
wget -qO - https://openresty.org/package/pubkey.gpg | sudo apt-key add -

sudo apt-get install -y install software-properties-common
sudo apt-get update
sudo apt-get install -y openresty
cp nginx.conf /usr/local/openresty/nginx/conf/
mkdir /usr/local/openresty/nginx/logs