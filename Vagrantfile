# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'centos64'
  config.vm.hostname = 'rails-dev-box-centos'

  config.vm.network :forwarded_port, guest: 4000, host: 4000

  config.vm.synced_folder './', '/vagrant'

  # config.vm.provision :shell, path: 'bootstrap.sh'
  config.vm.provision :itamae do |config|
    config.sudo = true
    config.shell = "/bin/sh"
    config.recipes = ["./onebox-recipes/recipes/base.rb"]
    config.json = "./onebox-recipes/nodes/node.json"
  end
end
