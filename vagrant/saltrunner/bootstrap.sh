
set -e

apt-get update
apt-get install -y salt-ssh python-minimal

cp /home/vagrant/parent-ssh/id_rsa /home/vagrant/.ssh/
chmod 0600 /home/vagrant/.ssh/id_rsa

chown vagrant:vagrant /var/log/salt/
chown vagrant:vagrant /etc/salt/

mkdir /home/vagrant/pki-dir
chown vagrant:vagrant /home/vagrant/pki-dir
mkdir /home/vagrant/cache-dir
chown vagrant:vagrant /home/vagrant/cache-dir
