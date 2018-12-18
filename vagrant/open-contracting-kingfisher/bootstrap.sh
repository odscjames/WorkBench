
set -e

echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

apt-get update
apt-get install -y python3 python3-pip postgresql-10

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
