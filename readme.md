## Virtual Machines For Work

# open-contracting-ocdsdata

    git clone git@github.com:open-contracting/ocdsdata.git open-contracting-ocdsdata
    vagrant up ocdsdata
    vagrant ssh ocdsdata
    cd /vagrant
    virtualenv .ve -p python3
    source .ve/bin/activate
    pip3 install -r requirements.txt 
    deactivate
