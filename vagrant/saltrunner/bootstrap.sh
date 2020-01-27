
set -e

apt-get update
apt-get install -y python3 python3-pip

pip3 install salt-ssh

cp /home/vagrant/parent-ssh/id_rsa /home/vagrant/.ssh/
chmod 0600 /home/vagrant/.ssh/id_rsa

mkdir -p /var/log/salt/
chown vagrant:vagrant /var/log/salt/
mkdir -p /etc/salt/
chown vagrant:vagrant /etc/salt/

mkdir -p /home/vagrant/pki-dir
chown vagrant:vagrant /home/vagrant/pki-dir
mkdir -p /home/vagrant/cache-dir
chown vagrant:vagrant /home/vagrant/cache-dir
