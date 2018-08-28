Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.define "ocdsdata" do |normal|

      config.vm.box = "ubuntu/bionic64"

      config.vm.network "forwarded_port", guest: 9090, host: 9090
      config.vm.network "forwarded_port", guest: 80, host: 8080

      config.vm.synced_folder "open-contracting-ocdsdata/", "/vagrant",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

      config.vm.provider "virtualbox" do |vb|
         # Display the VirtualBox GUI when booting the machine
         vb.gui = false

        # Customize the amount of memory on the VM:
        vb.memory = "2048"

        # https://github.com/boxcutter/ubuntu/issues/82#issuecomment-260902424
        vb.customize [
            "modifyvm", :id,
            "--cableconnected1", "on",
        ]

      end

      config.vm.provision :shell, path: "vagrant/ocdsdata/bootstrap.sh"

  end

    config.vm.define "open-contracting-extension_registry" do |normal|

        config.vm.synced_folder "open-contracting-extension_registry/", "/vagrant",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

        config.vm.provider "virtualbox" do |vb|
           # Display the VirtualBox GUI when booting the machine
           vb.gui = false

          # Customize the amount of memory on the VM:
          vb.memory = "1024"

          # https://github.com/boxcutter/ubuntu/issues/82#issuecomment-260902424
          vb.customize [
              "modifyvm", :id,
              "--cableconnected1", "on",
          ]

        end

        config.vm.provision :shell, path: "vagrant/open-contracting-extension_registry/bootstrap.sh"

    end

  config.vm.define "360-standard" do |normal|

      config.vm.network "forwarded_port", guest: 80, host: 8080

      config.vm.synced_folder "threesixtygiving-standard/", "/vagrant",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

      config.vm.synced_folder "vagrant/360-standard/", "/vagrantconf",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

      config.vm.provider "virtualbox" do |vb|
         # Display the VirtualBox GUI when booting the machine
         vb.gui = false

        # Customize the amount of memory on the VM:
        vb.memory = "1024"

        # https://github.com/boxcutter/ubuntu/issues/82#issuecomment-260902424
        vb.customize [
            "modifyvm", :id,
            "--cableconnected1", "on",
        ]

      end

      config.vm.provision :shell, path: "vagrant/360-standard/bootstrap.sh"

  end

    config.vm.define "360-getdata" do |normal|

        config.vm.network "forwarded_port", guest: 80, host: 8080

        config.vm.synced_folder "threesixtygiving-getdata/", "/vagrant",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

        config.vm.synced_folder "vagrant/360-getdata/", "/vagrantconf",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

        config.vm.provider "virtualbox" do |vb|
           # Display the VirtualBox GUI when booting the machine
           vb.gui = false

          # Customize the amount of memory on the VM:
          vb.memory = "1024"

          # https://github.com/boxcutter/ubuntu/issues/82#issuecomment-260902424
          vb.customize [
              "modifyvm", :id,
              "--cableconnected1", "on",
          ]

        end

        config.vm.provision :shell, path: "vagrant/360-getdata/bootstrap.sh"

    end

    config.vm.define "fireproofbox-standard" do |normal|


        config.vm.synced_folder "fireproofbox-standard/", "/vagrant",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

        config.vm.provider "virtualbox" do |vb|
           # Display the VirtualBox GUI when booting the machine
           vb.gui = false

          # Customize the amount of memory on the VM:
          vb.memory = "1024"

          # https://github.com/boxcutter/ubuntu/issues/82#issuecomment-260902424
          vb.customize [
              "modifyvm", :id,
              "--cableconnected1", "on",
          ]

        end

        config.vm.provision :shell, path: "vagrant/fireproofbox-standard/bootstrap.sh"

    end

        config.vm.define "cove" do |normal|


            config.vm.network "forwarded_port", guest: 8080, host: 8080

            config.vm.synced_folder "cove/", "/vagrant",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

            config.vm.provider "virtualbox" do |vb|
               # Display the VirtualBox GUI when booting the machine
               vb.gui = false

              # Customize the amount of memory on the VM:
              vb.memory = "1024"

              # https://github.com/boxcutter/ubuntu/issues/82#issuecomment-260902424
              vb.customize [
                  "modifyvm", :id,
                  "--cableconnected1", "on",
              ]

            end

            config.vm.provision :shell, path: "vagrant/cove/bootstrap.sh"

        end

        config.vm.define "odscjames-docson" do |normal|


            config.vm.network "forwarded_port", guest: 80, host: 8080

            config.vm.synced_folder "odscjames-docson/", "/vagrant",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

            config.vm.synced_folder "vagrant/odscjames-docson/", "/vagrantconf",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

            config.vm.provider "virtualbox" do |vb|
               # Display the VirtualBox GUI when booting the machine
               vb.gui = false

              # Customize the amount of memory on the VM:
              vb.memory = "1024"

              # https://github.com/boxcutter/ubuntu/issues/82#issuecomment-260902424
              vb.customize [
                  "modifyvm", :id,
                  "--cableconnected1", "on",
              ]

            end

            config.vm.provision :shell, path: "vagrant/odscjames-docson/bootstrap.sh"

        end



        config.vm.define "sisocs" do |normal|


            config.vm.network "forwarded_port", guest: 80, host: 8080

            config.vm.synced_folder "sisocs/", "/vagrant",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

            config.vm.synced_folder "vagrant/sisocs/", "/vagrantconf",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

            config.vm.provider "virtualbox" do |vb|
               # Display the VirtualBox GUI when booting the machine
               vb.gui = false

              # Customize the amount of memory on the VM:
              vb.memory = "1024"

              # https://github.com/boxcutter/ubuntu/issues/82#issuecomment-260902424
              vb.customize [
                  "modifyvm", :id,
                  "--cableconnected1", "on",
              ]

            end

            config.vm.provision :shell, path: "vagrant/sisocs/bootstrap.sh"

        end

        config.vm.define "python3" do |normal|


            config.vm.network "forwarded_port", guest: 5000, host: 5000

            config.vm.synced_folder ".", "/vagrant",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

            config.vm.provider "virtualbox" do |vb|
               # Display the VirtualBox GUI when booting the machine
               vb.gui = false

              # Customize the amount of memory on the VM:
              vb.memory = "1024"

              # https://github.com/boxcutter/ubuntu/issues/82#issuecomment-260902424
              vb.customize [
                  "modifyvm", :id,
                  "--cableconnected1", "on",
              ]

            end

            config.vm.provision :shell, path: "vagrant/python3/bootstrap.sh"

        end

        config.vm.define "bonobo" do |normal|

            config.vm.box = "ubuntu/bionic64"

            config.vm.synced_folder "bonobo", "/vagrant",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

            config.vm.provider "virtualbox" do |vb|
               # Display the VirtualBox GUI when booting the machine
               vb.gui = false

              # Customize the amount of memory on the VM:
              vb.memory = "1024"

              # https://github.com/boxcutter/ubuntu/issues/82#issuecomment-260902424
              vb.customize [
                  "modifyvm", :id,
                  "--cableconnected1", "on",
              ]

            end

            config.vm.provision :shell, path: "vagrant/bonobo/bootstrap.sh"

        end


        config.vm.define "salttarget18" do |normal|

            config.vm.box = "ubuntu/bionic64"

            config.vm.network "forwarded_port", guest: 80, host: 8080
            config.vm.network "forwarded_port", guest: 9090, host: 9090

            config.vm.provider "virtualbox" do |vb|
               # Display the VirtualBox GUI when booting the machine
               vb.gui = false

              # Customize the amount of memory on the VM:
              vb.memory = "2048"

              # https://github.com/boxcutter/ubuntu/issues/82#issuecomment-260902424
              vb.customize [
                  "modifyvm", :id,
                  "--cableconnected1", "on",
              ]

            end

            config.vm.provision :shell, path: "vagrant/salttarget18/bootstrap.sh"

        end

        config.vm.define "jsonschema-info-table" do |normal|

            config.vm.box = "ubuntu/bionic64"

            config.vm.synced_folder "jsonschema-info-table/", "/vagrant",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

            config.vm.synced_folder "vagrant/jsonschema-info-table/", "/vagrantconf",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

            config.vm.provider "virtualbox" do |vb|
               # Display the VirtualBox GUI when booting the machine
               vb.gui = false

              # Customize the amount of memory on the VM:
              vb.memory = "1024"

              # https://github.com/boxcutter/ubuntu/issues/82#issuecomment-260902424
              vb.customize [
                  "modifyvm", :id,
                  "--cableconnected1", "on",
              ]

            end

            config.vm.provision :shell, path: "vagrant/jsonschema-info-table/bootstrap.sh"

        end

end
