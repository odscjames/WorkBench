#!/bin/bash

set -e

apt-get update
apt-get install -y python3 python3-pip tox

add-apt-repository -y ppa:deadsnakes/ppa
apt-get update
apt-get install -y python3.4 python3.5 python3.7

pip3 install pytest jsonref jsonpointer recommonmark flake8 sphinx-testing
