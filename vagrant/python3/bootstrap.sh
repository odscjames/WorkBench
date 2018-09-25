#!/bin/bash

set -e

apt-get update
apt-get install -y python3 python3-pip

# flatten-tool needs this
apt-get install libpython3.5-testsuite

pip3 install flake8 pytest virtualenv
