#!/bin/bash -xe



. /etc/yespoho/platform.config

cd $LIVE_DIR
sudo chown -R ubuntu.ubuntu $LIVE_DIR
[ -f 'nginx.conf' ] && cp nginx.conf /usr/local/openresty/nginx/conf/

#Install Ejabberd
wget https://www.process-one.net/downloads/ejabberd/17.09/ejabberd_17.09-0_amd64.deb
sudo apt install ./ejabberd_17.09-0_amd64.deb
rm ejabberd_17.09-0_amd64.deb

#Give +x to all scripts and run
cd $LIVE_DIR
sudo chmod +x scripts/*.sh
scripts/configure.sh
scripts/launch_postgrest.sh