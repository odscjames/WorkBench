#!/bin/bash

set -e

apt-get update
apt-get install -y python3 python3-pip apache2


cd /vagrant && pip3 install -r requirements.txt

mkdir /out
chown -R vagrant:users /out

cp /vagrantconf/apache.conf /etc/apache2/sites-enabled/000-default.conf
/etc/init.d/apache2 restart

echo "alias build-sphinx='/vagrantconf/build-sphinx.sh'" >> /home/vagrant/.bashrc
