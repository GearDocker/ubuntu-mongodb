#
# Cookbook Name:: jiffy_mongodb
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

bash "compile ruby" do
  user "root"
  code <<-EOH
    apt-get -y update
    apt-get -y install build-essential zlib1g-dev libssl-dev libreadline-dev libyaml-dev libcurl4-openssl-dev curl git-core python-software-properties
    wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p385.tar.gz
    tar -xvzf ruby-1.9.3-p385.tar.gz
    cd ruby-1.9.3-p385/
    ./configure
    make
    sudo make install
    echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
    sudo gem install bundler
  EOH
    not_if "ls /usr/local/bin/ruby"
end

execute "apt-get-update" do
  command "apt-get update"
end

execute "install_locale" do
  command "locale-gen en_US.UTF-8"
end

