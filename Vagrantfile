# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/ubuntu-20.04"
  config.ssh.insert_key = false
  config.vm.boot_timeout = 3600
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider :virtualbox do |v|
    v.memory = 2048
  end

  # Yolomy Application server 
  config.vm.define "app" do |app|
    app.vm.hostname = "yolomy.app"
    app.vm.network :private_network, ip: "192.168.47.7"
  end

  # Provisioning configuration for Ansible.
  config.vm.provision "ansible" do |ansible|
  ansible.playbook = "playbook.yaml"
  end
end
