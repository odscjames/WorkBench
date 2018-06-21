
set -e

apt-get update
apt-get install -y apache2

cp /vagrantconf/apache.conf /etc/apache2/sites-enabled/000-default.conf
/etc/init.d/apache2 restart
