# -*- mode: ruby -*-
# vi: set ft=ruby :

upload_dest = "/tmp/tsurami-vagrant"

Vagrant.configure("2") do |config|
  config.vm.box = "tsurami/xenial64"
  config.vm.synced_folder "synced", "/vagrant", disabled: true

  config.vm.provision "shell", inline: "rm -rf #{upload_dest}"
  config.vm.provision "file", source: "upload", destination: upload_dest

  config.vm.provision "shell", path: "scripts/set_private_key.sh", args: "root #{upload_dest}/id_rsa /root/.ssh/id_rsa"
  config.vm.provision "shell", path: "scripts/add_public_key.sh", args: "root #{upload_dest}/id_rsa.pub /root/.ssh/authorized_keys"

  config.vm.provision "shell", path: "scripts/set_private_key.sh", args: "vagrant #{upload_dest}/id_rsa /home/vagrant/.ssh/id_rsa"
  config.vm.provision "shell", path: "scripts/add_public_key.sh", args: "vagrant #{upload_dest}/id_rsa.pub /home/vagrant/.ssh/authorized_keys"

  config.vm.define "tsurami-control" do |host|
    host.vm.hostname = "tsurami-control"
    host.vm.network "private_network", ip: "192.168.56.10"

    host.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", "1024"]
        v.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end

  config.vm.define "tsurami-local" do |host|
    host.vm.hostname = "tsurami-local"
    host.vm.network "private_network", ip: "192.168.56.20"

    host.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end
end
