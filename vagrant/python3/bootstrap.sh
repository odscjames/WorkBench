#!/bin/bash

set -e

apt-get update
apt-get install -y python3 python3-pip

# flatten-tool needs this
apt-get install libpython3.5-testsuite

# translation needs this
apt-get install gettext


pip3 install flake8 pytest virtualenv


# Install Google Clasp for App Script
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs
npm i @google/clasp -g
