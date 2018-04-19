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

# sphinx

    mkdir sphinx
    vagrant up sphinx

## sphinx for openownership-data-standard

    mkdir -p sphinx/out/openownership-data-standard
    git clone git@github.com:openownership/data-standard.git sphinx/openownership-data-standard
    cd sphinx/openownership-data-standard
    git submodule init
    git submodule update

    vagrant ssh sphinx
    sphinx-build   /vagrant/openownership-data-standard/docs/ /vagrant/out/openownership-data-standard/

Then see http://localhost:8080/openownership-data-standard/
