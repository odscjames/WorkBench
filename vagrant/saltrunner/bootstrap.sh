
set -e

wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/2019.2/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo "deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/2019.2 bionic main" >> /etc/apt/sources.list.d/saltstack.list

apt-get update
apt-get install -y salt-ssh python3-minimal

cp /home/vagrant/parent-ssh/id_rsa /home/vagrant/.ssh/
chmod 0600 /home/vagrant/.ssh/id_rsa

chown vagrant:vagrant /var/log/salt/
chown vagrant:vagrant /etc/salt/

mkdir /home/vagrant/pki-dir
chown vagrant:vagrant /home/vagrant/pki-dir
mkdir /home/vagrant/cache-dir
chown vagrant:vagrant /home/vagrant/cache-dir
