# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'chef/centos-6.5'
  config.vm.hostname = 'rails-dev-box-centos'

  config.vm.network :forwarded_port, guest: 3000, host: 3000
end
