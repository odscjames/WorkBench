#!/bin/bash

set -e

export PYTHONPATH=$PYTHONPATH:/vagrant/

cd /vagrant/documentation

sphinx-build  -a /vagrant/documentation   /out/
