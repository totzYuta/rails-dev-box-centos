#!/usr/bin/env bash

# set interactive environmental-valiables
PS1='$ '
source ~/.bashrc

# git
echo 'Installing git...'
sudo yum -y install git

# packages
echo 'Installing packages...'
sudo yum -y install gcc-c++ glibc-headers openssl-devel readline libyaml-devel readline-devel zlib zlib-devel

# rbenv
echo 'Installing rbenv...'
RBENV_CONFIG=/etc/profile.d/rbenv.sh
sudo git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv 
sudo touch $RBENV_CONFIG
sudo echo 'export RBENV_ROOT="/usr/local/rbenv"' >> $RBENV_CONFIG
sudo echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> $RBENV_CONFIG
sudo echo 'eval "$(rbenv init -)"' >> $RBENV_CONFIG
sudo chmod -R 755 /usr/local/rbenv/
source $RBENV_CONFIG

# ruby-build
echo 'Installing ruby-build...'
sudo git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

# Ruby
echo 'Installing Ruby...'
rbenv install -v 2.2.3
rbenv rehash
rbenv global 2.2.3
source $RBENV_CONFIG

# Rails
echo 'Installing Rails...'
gem update --system
sudo yum -y install libxml2 libxslt libxml2-devel libxsl
sudo chmod 757 /usr/local/rbenv/shims
sudo chown -R vagrant /usr/local/
gem install --no-document nokogiri -v '1.6.1'
gem install --no-document rails -v "~> 4.2.0"
gem install --no-document bundler
rbenv rehash

# MySQL
echo 'Intalling MySQL...'
sudo yum -y install mysql-server
sudo yum -y install mysql-devel
echo 'Starting mysqld'
sudo service mysqld start

# redis
echo 'Installing redis...'
sudo rpm -ivh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo chmod 757 /etc/yum.repos.d
sudo chmod 757 /etc/yum.repos.d/epel.repo
sudo mv /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.org
sudo sed -e 's/#baseurl/baseurl/' /etc/yum.repos.d/epel.repo.org \
  | sed 's/mirrorlist/#mirrorlist/' > /etc/yum.repos.d/epel.repo
sudo yum -y install redis --enablerepo=epel
sudo chkconfig redis on

echo 'All Done! Enjoy Your Rails Development.'
