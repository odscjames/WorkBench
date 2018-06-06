
set -e

apt-get update
apt-get install -y python3 python3-pip


pip3 install jsonschema
cd /vagrant && pip3 install -e git+https://github.com/OpenDataServices/flatten-tool.git@7fa96933b8fc3ba07a3d44fe07dccf2791165686#egg=flattentool
