#!/usr/bin/env bash

echo 'Installing git...'
sudo yum -y install git

echo 'Installing packages...'
sudo yum -y install gcc-c++ glibc-headers openssl-devel readline libyaml-devel readline-devel zlib zlib-devel

echo 'Installing rbenv...'
sudo git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv 
sudo echo 'export RBENV_ROOT="/usr/local/rbenv"' >> ~/.bash_profile
sudo echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> ~/.bash_profile
sudo echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
sudo chmod -R 777 /usr/local/rbenv/
source ~/.bash_profile

echo 'Installing ruby-build...'
sudo git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

echo 'Installing Ruby...'
rbenv install -v 2.2.2
rbenv rehash
rbenv global 2.2.2
source ~/.bash_profile

echo 'Installing Rails...'
gem update --system
sudo yum -y install libxml2 libxslt libxml2-devel libxsl
gem install nokogiri -v 1.6.2.1 -- --use-system-librarie
gem install --no-ri --no-rdoc rails --version "~>4.2.0"
gem install bundler
rbenv rehash

echo 'Intalling MySQL'
sudo yum -y install mysql-server
sudo yum -y install mysql-devel
echo 'Starting mysqld'
sudo service mysqld start

echo 'All Done! Enjoy Your Rails Development.'
