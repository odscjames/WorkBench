#!/bin/bash

set -e

apt-get update
apt-get install -y python3 python3-pip

pip3 install flake8 pytest virtualenv
