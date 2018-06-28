
set -e

debconf-set-selections <<< 'mysql-server mysql-server/root_password password rootpassword'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password rootpassword'

apt-get update
apt-get install -y apache2 mysql-server php php-mysql unzip libapache2-mod-php

cp /vagrantconf/apache.conf /etc/apache2/sites-enabled/000-default.conf
/etc/init.d/apache2 restart


wget -O /tmp/yii.zip https://github.com/yiisoft/yii/releases/download/1.1.19/yii-1.1.19.5790cb.zip
cd / && unzip /tmp/yii.zip
mv /yii-1.1.19.5790cb/ /yii

mysql -u root --password=rootpassword -e "CREATE DATABASE app;"
mysql -u root --password=rootpassword -e "GRANT ALL ON app.* to app@localhost IDENTIFIED BY 'apppassword';"
