## Virtual Machines For Work

# open-contracting-ocdsdata

    git clone git@github.com:open-contracting/ocdsdata.git open-contracting-ocdsdata
    vagrant up ocdsdata
    vagrant ssh ocdsdata
    cd /vagrant
    virtualenv .ve -p python3
    source .ve/bin/activate
    pip3 install -r requirements.txt
    pip3 install flake8
    deactivate

# 360-standard

    git clone git@github.com:ThreeSixtyGiving/standard.git threesixtygiving-standard
    vagrant up 360-standard
    vagrant ssh 360-standard
    build-sphinx

See http://localhost:8080/
