
set -e

apt-get update
apt-get install -y python3 python3-pip apache2 build-essential ruby-dev

pip3 install virtualenv recommonmark sphinx==1.5.6

cp /config/apache.conf /etc/apache2/sites-enabled/000-default.conf
/etc/init.d/apache2 restart

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs
npm install -g grunt-cli

gem install sass
