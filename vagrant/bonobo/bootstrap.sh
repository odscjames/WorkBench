
set -e

echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

apt-get update
apt-get install -y python3 python3-pip postgresql-10 graphviz

sudo su --login -c "psql -c \"CREATE USER app WITH PASSWORD 'password';\"" postgres
sudo su --login -c "psql -c \"CREATE DATABASE app WITH OWNER app ENCODING 'UTF8'  LC_COLLATE='en_GB.UTF-8' LC_CTYPE='en_GB.UTF-8'  TEMPLATE=template0 ;\"" postgres


pip3 install requests


echo "alias db='psql -U  app app  -hlocalhost'" >> /home/vagrant/.bashrc
echo "localhost:5432:app:app:password" > /home/vagrant/.pgpass
chown vagrant:vagrant /home/vagrant/.pgpass
chmod 0600 /home/vagrant/.pgpass
