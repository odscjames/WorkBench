Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.define "ocdsdata" do |normal|

      config.vm.synced_folder "open-contracting-ocdsdata/", "/vagrant",  :owner=> 'ubuntu', :group=>'users', :mount_options => ['dmode=777', 'fmode=777']

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

      config.vm.provision :shell, path: "vagrant/ocdsdata/bootstrap.sh"

  end


end
