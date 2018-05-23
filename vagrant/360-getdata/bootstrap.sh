#!/bin/bash

set -e

apt-get update
apt-get install -y apache2 jekyll


mkdir /out
chown -R vagrant:users /out

cp /vagrantconf/apache.conf /etc/apache2/sites-enabled/000-default.conf
/etc/init.d/apache2 restart

echo "alias build-jekyll='/vagrantconf/build-jekyll.sh'" >> /home/vagrant/.bashrc
