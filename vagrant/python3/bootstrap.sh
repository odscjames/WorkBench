#!/bin/bash

set -e

# This is to get other versions of Python https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa
add-apt-repository ppa:deadsnakes/ppa

apt-get update

# install default Python 3.6 for bionic and other libs
DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip unzip chromium-browser
# Install all the Pythons!
DEBIAN_FRONTEND=noninteractive apt-get install -y python3.4
DEBIAN_FRONTEND=noninteractive apt-get install -y python3.5
DEBIAN_FRONTEND=noninteractive apt-get install -y python3.7
DEBIAN_FRONTEND=noninteractive apt-get install -y python3.8


# flatten-tool needs this
apt-get install libpython3.6-testsuite

# translation needs this
apt-get install gettext


pip3 install black isort flake8 pytest virtualenv tox Sphinx sphinx_rtd_theme


# Install Google Clasp for App Script
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs
npm i @google/clasp -g


# Install Selenium stuff
mkdir /home/vagrant/bin
cd /tmp
wget https://chromedriver.storage.googleapis.com/2.36/chromedriver_linux64.zip
unzip chromedriver_linux64.zip -d /home/vagrant/bin

export PATH=$PATH:`pwd`/chromedriver

# Docker
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y docker-ce docker-ce-cli containerd.io
groupadd -f docker
usermod -aG docker vagrant

