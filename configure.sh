#!/bin/bash

export PGHOST="host"
export PGPORT="port"
export PGDB="db"
export PGUSER="user"
export PGPASS="pass"

sed -i "s#db-uri = .*#db-uri = \"postgres://$PGUSER:$PGPASS@$PGHOST:$PGPORT/$PGDB\"#g" \
    core_schema.conf event_schema.conf guest_schema.conf jwt.conf membership_schema.conf \
    order_schema.conf partner_schema.conf pricing_schema.conf saree_schema.conf shipping_schema.conf


wget -qO - https://openresty.org/package/pubkey.gpg | sudo apt-key add -

sudo yum -y install software-properties-common
sudo yum update
sudo yum install openresty

