## Virtual Machines For Work

# open-contracting-k

# open-contracting-kingfisher

    git clone git@github.com:open-contracting/kingfisher-scrape.git open-contracting-kingfisher-scrape
    git clone git@github.com:open-contracting/kingfisher-process.git open-contracting-kingfisher-process
    git clone git@github.com:open-contracting/kingfisher.git open-contracting-kingfisher
    vagrant up open-contracting-kingfisher
    vagrant ssh open-contracting-kingfisher
    cd /vagrant-process
    virtualenv .ve -p python3
    source .ve/bin/activate
    pip3 install -r requirements.txt
    pip3 install flake8 pytest
    DB_URI=postgresql://test:test@localhost:5432/test pytest tests/
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

# odscjames-docson

    git clone git@github.com:odscjames/docson.git odscjames-docson
    vagrant up odscjames-docson
    vagrant ssh odscjames-docson

# sisocs review

    mkdir sisocs

extract contents of the 2 compressed code folders into this

    vagrant up sisocs
    vagrant ssh sisocs
    cd /vagrant
    mysql -uroot -p --default-character-set=utf8 app

Type rootpassword

    SET names 'utf8';
    SOURCE /vagrant/20180627.sisocs_training.sql
    exit


# open-contracting-extensions-data-collector

    git clone git@github.com:open-contracting/extensions-data-collector.git open-contracting-extensions-data-collector
    cd open-contracting-extensions-data-collector
    virtualenv .ve -p python3
    source .ve/bin/activate
    pip3 install -r requirements.txt
    pip3 install flake8
    deactivate

# bonobo

    mkdir bonobo
    cd bonobo
    git clone git@github.com:python-bonobo/bonobo-sqlalchemy.git
    git clone git@github.com:python-bonobo/bonobo.git
    vagrant up bonobo
    vagrant ssh bonobo
    cd /vagrant
    pip3 install -e bonobo -e bonobo-sqlalchemy

# fireproofbox-standard

???

# python3

???

# salttarget18

???

# jsonschema-info-table


    vagrant up jsonschema-info-table
    vagrant ssh jsonschema-info-table
    cd /vagrant
    pip3 install -e .


# saltrunner

To actually make this work, you also need to add to salt-config/master


    pki_dir: /home/vagrant/pki-dir
    cachedir: /home/vagrant/cache-dir

And for each host you want to use, you need to change salt-config/roster to

    xyz:
        host: xyz.default.opendataservices.uk0.bigv.io
        priv: /home/vagrant/.ssh/id_rsa
