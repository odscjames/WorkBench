
set -e

apt-get update
apt-get install -y python3 python3-pip apache2

pip3 install virtualenv recommonmark sphinx==1.5.6

cp /config/apache.conf /etc/apache2/sites-enabled/000-default.conf
/etc/init.d/apache2 restart
