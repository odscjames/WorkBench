#!/bin/bash

set -e

apt-get update
apt-get install -y python3 python3-pip apache2

cd /vagrant && pip3 install -r requirements.txt

pip3 install flake8

 
