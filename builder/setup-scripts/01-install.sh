#!/bin/bash -xe
#   Copyright  2016-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
#   Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance with the License. A copy of the License is located at
#
#   http://aws.amazon.com/apache2.0/
#
#   or in the "license" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.



. $BUILDER_DIR/CONFIG
# get repo keys for openresty and pg 9.6
wget -qO - https://openresty.org/package/pubkey.gpg | sudo apt-key add -
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  sudo apt-key add -

# Add Repos 
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main"
sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" >  /etc/apt/sources.list.d/pgdg.list

#Install
sudo apt-get update
sudo apt-get install -y openresty awscli unzip git
sudo apt-get install -y golang-go openjdk-8* libpq5 libpq-dev
sudo apt-get install postgresql-9.6
