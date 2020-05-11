#!/bin/bash

set -e


################ POSTGRESQL

echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

apt-get update
apt-get install -y postgresql-10

sudo su --login -c "psql -c \"CREATE USER app WITH PASSWORD 'app';\"" postgres
sudo su --login -c "psql -c \"CREATE DATABASE app WITH OWNER app ENCODING 'UTF8'  LC_COLLATE='en_GB.UTF-8' LC_CTYPE='en_GB.UTF-8'  TEMPLATE=template0 ;\"" postgres

sudo su --login -c "psql -c \"CREATE USER test WITH PASSWORD 'test';\"" postgres
sudo su --login -c "psql -c \"CREATE DATABASE test WITH OWNER test ENCODING 'UTF8'  LC_COLLATE='en_GB.UTF-8' LC_CTYPE='en_GB.UTF-8'  TEMPLATE=template0 ;\"" postgres


################ ELASTICSEARCH

wget -O - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install -y elasticsearch

systemctl daemon-reload
systemctl enable elasticsearch.service
systemctl start elasticsearch.service

################ NODE

# NVW is cool but because we are installing in a virtual machine we only need one version

wget -O /home/vagrant/node.tar.xz https://nodejs.org/dist/v13.9.0/node-v13.9.0-linux-x64.tar.xz
cd /home/vagrant/
tar xf node.tar.xz
mv node-v* node
echo "export PATH=\"/home/vagrant/node/bin:\$PATH\"" >> /home/vagrant/.bashrc 


