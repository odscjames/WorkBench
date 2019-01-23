
set -e

echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

apt-get update
apt-get install -y python3 python3-pip postgresql-10 uwsgi apache2 libapache2-mod-proxy-uwsgi uwsgi-plugin-python3 supervisor


sudo su --login -c "psql -c \"CREATE USER ocdskingfisher WITH PASSWORD 'ocdskingfisher';\"" postgres
sudo su --login -c "psql -c \"CREATE DATABASE ocdskingfisher WITH OWNER ocdskingfisher ENCODING 'UTF8'  LC_COLLATE='en_GB.UTF-8' LC_CTYPE='en_GB.UTF-8'  TEMPLATE=template0 ;\"" postgres

sudo su --login -c "psql -c \"CREATE USER test WITH PASSWORD 'test';\"" postgres
sudo su --login -c "psql -c \"CREATE DATABASE test WITH OWNER test ENCODING 'UTF8'  LC_COLLATE='en_GB.UTF-8' LC_CTYPE='en_GB.UTF-8'  TEMPLATE=template0 ;\"" postgres



pip3 install sphinx virtualenv


echo "alias db='psql -U  ocdskingfisher ocdskingfisher  -hlocalhost'" >> /home/vagrant/.bashrc
echo "localhost:5432:ocdskingfisher:ocdskingfisher:ocdskingfisher" > /home/vagrant/.pgpass
chown vagrant:vagrant /home/vagrant/.pgpass
chmod 0600 /home/vagrant/.pgpass

mkdir -p /home/vagrant/.config/ocdskingfisher-process

echo "[DBHOST]" > /home/vagrant/.config/ocdskingfisher-process/config.ini
echo "HOSTNAME = localhost" >> /home/vagrant/.config/ocdskingfisher-process/config.ini
echo "PORT = 5432" >> /home/vagrant/.config/ocdskingfisher-process/config.ini
echo "USERNAME = ocdskingfisher" >> /home/vagrant/.config/ocdskingfisher-process/config.ini
echo "PASSWORD = ocdskingfisher" >> /home/vagrant/.config/ocdskingfisher-process/config.ini
echo "DBNAME = ocdskingfisher" >> /home/vagrant/.config/ocdskingfisher-process/config.ini
echo "[WEB]" >> /home/vagrant/.config/ocdskingfisher-process/config.ini
echo "API_KEYS = cat,dog" >> /home/vagrant/.config/ocdskingfisher-process/config.ini

chown -R vagrant /home/vagrant/.config

mkdir /data
chown vagrant /data

htpasswd -c -b /etc/apache2/auth-user-file cat dog

cp /vagrantconf/apache.conf /etc/apache2/sites-enabled/kingfisherprocess.conf
cp /vagrantconf/apache-scrapyd.conf /etc/apache2/sites-enabled/scrapyd.conf
a2enmod  proxy proxy_uwsgi proxy_http
systemctl restart apache2

cp /vagrantconf/uwsgi.ini /etc/uwsgi/apps-enabled/kingfisherprocess.ini
cp /vagrantconf/wsgi.py /vagrant-process/
systemctl restart uwsgi

adduser --disabled-password --gecos "" ocdskfs

mkdir /scrapyd
chown ocdskfs /scrapyd
cd /scrapyd
virtualenv .ve -p python3
source .ve/bin/activate; pip3 install scrapyd requests

mkdir /etc/scrapyd/
cp /vagrantconf/scrapyd.ini /etc/scrapyd/scrapyd.conf

mkdir /scrapyd/dir_eggs
mkdir /scrapyd/dir_dbs
mkdir /scrapyd/dir_logs
mkdir /scrapyd/dir_items
mkdir /scrapyd/data
chown ocdskfs /scrapyd/dir_eggs
chown ocdskfs /scrapyd/dir_dbs
chown ocdskfs /scrapyd/dir_logs
chown ocdskfs /scrapyd/dir_items
chown ocdskfs /scrapyd/data


cp /vagrantconf/supervisor.conf /etc/supervisor/conf.d/scrapyd.conf
cp /vagrantconf/scrapyd.sh /scrapyd/scrapyd.sh
chmod a+x /scrapyd/scrapyd.sh
/etc/init.d/supervisor restart
