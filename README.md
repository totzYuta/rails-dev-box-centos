# Rails Development Environment on CentOS by Vagrant

## Versions

* Ruby 2.2.3
* Rails ~>4.2.0
* CentOS 64
* MySQL
* redis

## How to

1. Cloning this repo.

```
$ git clone https://github.com/totzyuta/rails-dev-box-centos.git
$ cd rails-dev-box-centos
```

2. Install vagrant-itamae plugin

It uses itamae for provisioning

```
$ vagrant plugin install vagrant-itamae
```

3. Vagrant up.

```
$ vagrant up
```

## Notice

* Please use bash
* Folder synced host:`./` with VM:`/vagrant`
* Without doc in default.
* It would take about 15 mins to setup.
* You can start creating Rails app in this root directory
