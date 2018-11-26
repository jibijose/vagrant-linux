Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.box_check_update = false

    config.vm.network "forwarded_port", host: 9200, guest: 9200 # Elasticsearch
    config.vm.network "forwarded_port", host: 9300, guest: 9300 # Logtash
    config.vm.network "forwarded_port", host: 5601, guest: 5601 # Kibana
    
    config.vm.provider "virtualbox" do |v|
          v.name = "elkbase"
          v.cpus = 2
          v.memory = 4096
          v.gui = false
        end
  
      config.vm.provision "shell", inline: "echo Installing dos2unix."
      config.vm.provision "shell", inline: "apt-get update -qq"
      config.vm.provision "shell", inline: "apt-get install -y -qq dos2unix"
      config.vm.provision "shell", inline: "dos2unix /vagrant/scripts/*.sh"
      config.vm.provision "shell", inline: "dos2unix /vagrant/scripts/*/*.sh"
      
      config.vm.provision :shell, path: "scripts/bootstrap_base.sh"
  end
  