
set -e

echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

apt-get update
apt-get install -y python3 python3-pip postgresql-10

sudo su --login -c "psql -c \"CREATE USER ocdsdata WITH PASSWORD 'ocdsdata';\"" postgres
sudo su --login -c "psql -c \"CREATE DATABASE ocdsdata WITH OWNER ocdsdata ENCODING 'UTF8'  LC_COLLATE='en_GB.UTF-8' LC_CTYPE='en_GB.UTF-8'  TEMPLATE=template0 ;\"" postgres


pip3 install sphinx virtualenv


echo "alias db='psql -U  ocdsdata ocdsdata  -hlocalhost'" >> /home/vagrant/.bashrc
echo "localhost:5432:ocdsdata:ocdsdata:ocdsdata" > /home/vagrant/.pgpass
chown vagrant:vagrant /home/vagrant/.pgpass
chmod 0600 /home/vagrant/.pgpass

mkdir -p /home/vagrant/.config/ocdsdata

echo "[DBHOST]" >> /home/vagrant/.config/ocdsdata/config.ini
echo "HOSTNAME = localhost" >> /home/vagrant/.config/ocdsdata/config.ini
echo "PORT = 5432" >> /home/vagrant/.config/ocdsdata/config.ini
echo "USERNAME = ocdsdata" >> /home/vagrant/.config/ocdsdata/config.ini
echo "PASSWORD = ocdsdata" >> /home/vagrant/.config/ocdsdata/config.ini
echo "DBNAME = ocdsdata" >> /home/vagrant/.config/ocdsdata/config.ini
