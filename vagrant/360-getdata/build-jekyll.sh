#!/bin/bash

set -e

cd /vagrant

jekyll build  -d /out
