# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'lxc'

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "wmongodb"
  config.vm.box = "base"
  #config.omnibus.chef_version = :latest
  config.omnibus.chef_version = '11.6.0'
  config.vm.boot_timeout = 120
  config.berkshelf.enabled = true

  config.vm.provider :lxc do |lxc|
    # Same effect as 'customize ["modifyvm", :id, "--memory", "1024"]' for VirtualBox
    lxc.customize 'cgroup.memory.limit_in_bytes', '512M'
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.roles_path = ["roles"]
    chef.add_role "ruby_attr"
    chef.add_role "mongodb_attr"
    chef.add_role "mongoreplica_attr"
    chef.add_recipe 'wmongodb::install_ruby'
    chef.add_recipe 'mongodb::simple_install'
    #chef.add_recipe 'mongodb::yml_configure_mongod_replica'
    #chef.add_recipe "mongodb::replicaset_yml"
    #chef.add_recipe "mongodb::replicaset_yml_onetime"
    
  end

end
