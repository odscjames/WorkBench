
set -e

echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" >> /etc/apt/sources.list.d/pgdg.list

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

apt-get update
apt-get install -y python3 python3-pip postgresql-10 

sudo su --login -c "psql -c \"CREATE USER ocdsdata WITH PASSWORD 'ocdsdata';\"" postgres
sudo su --login -c "psql -c \"CREATE DATABASE ocdsdata WITH OWNER ocdsdata ENCODING 'UTF8'  LC_COLLATE='en_GB.UTF-8' LC_CTYPE='en_GB.UTF-8'  TEMPLATE=template0 ;\"" postgres


pip3 install virtualenv
 

echo "alias db='psql -U  ocdsdata ocdsdata  -hlocalhost'" >> /home/vagrant/.bashrc
echo "localhost:5432:ocdsdata:ocdsdata:ocdsdata" > /home/vagrant/.pgpass
chown vagrant:vagrant /home/vagrant/.pgpass
chmod 0600 /home/vagrant/.pgpass


