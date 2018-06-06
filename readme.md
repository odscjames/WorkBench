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

# open-contracting-extension_registry

    git clone git@github.com:open-contracting/extension_registry.git open-contracting-extension_registry
    vagrant up open-contracting-extension_registry
    vagrant ssh open-contracting-extension_registry
    python3 /vagrant/validate.py
    python3 /vagrant/compile.py
    runtests
    flake8 --max-line-length=119


For standard tests:

    curl -o /vagrant/test_csv.py   https://raw.githubusercontent.com/open-contracting/standard-maintenance-scripts/master/tests/test_csv.py


# 360-standard

    git clone git@github.com:ThreeSixtyGiving/standard.git threesixtygiving-standard
    vagrant up 360-standard
    vagrant ssh 360-standard
    build-sphinx

See http://localhost:8080/



# 360-getdata

    git clone git@github.com:ThreeSixtyGiving/getdata.git threesixtygiving-getdata
    vagrant up 360-getdata
    vagrant ssh 360-getdata
    build-jekyll

See http://localhost:8080/

# fireproofbox-standard


    git clone git@github.com:OpenDataServices/fireproofbox-standard.git fireproofbox-standard
    vagrant up fireproofbox-standard
    vagrant ssh fireproofbox-standard

# cove


    git clone git@github.com:OpenDataServices/cove.git cove
    vagrant up cove
    vagrant ssh cove
