# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
   config.vm.define "centos7" do |subconfig|
      subconfig.vm.box = "centos/7"
      subconfig.vm.hostname = "jenkins.local"
      subconfig.vm.network "private_network", ip: "10.0.0.10"
      subconfig.vm.network "public_network"
      subconfig.vm.synced_folder ".", "/vagrant"
      subconfig.vm.provider "virtualbox" do |vb|
         vb.name = "jenkins_centos7"
         vb.memory = "1024"
       end
      subconfig.vm.provision "shell", inline: <<-SHELL
        bash /vagrant/vm-scripts/install_puppet.sh
        rm -rf /etc/puppetlabs/code/environments/production && ln -s /vagrant/production /etc/puppetlabs/code/environments/production
        /opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp 
       SHELL
   end
   config.vm.define "centos8" do |subconfig|
      subconfig.vm.box = "centos/8"
      subconfig.vm.hostname = "jenkins.local"
      subconfig.vm.network "private_network", ip: "10.0.0.11"
      subconfig.vm.network "public_network"
      subconfig.vm.synced_folder ".", "/vagrant"
      subconfig.vm.provider "virtualbox" do |vb|
         vb.name = "jenkins_centos8"
         vb.memory = "1024"
       end
      subconfig.vm.provision "shell", inline: <<-SHELL
        bash /vagrant/vm-scripts/install_puppet.sh
        rm -rf /etc/puppetlabs/code/environments/production && ln -s /vagrant/production /etc/puppetlabs/code/environments/production
        /opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp 
       SHELL
   end
end
