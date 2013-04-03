#
# Cookbook Name:: ruby_build
# Recipe:: default
#
# Copyright (C) 2013 Daniel Nolte

%w{build-essential zlib1g-dev libyaml-dev 
   libssl-dev libgdbm-dev libreadline-dev
 	 libncurses5-dev libffi-dev}.each do |pkg|
 package pkg do 
   action :install
 end
end

# --- install ruby-build

unless File.exist? "/usr/local/bin/ruby-build"

  directory "/tmp/setup-ruby-build" do
    owner  "root"
    group  "root"
    mode   0755
    action :create
  end

  cookbook_file "/tmp/setup-ruby-build/ruby-build.tar.gz" do
    backup false
    action :create_if_missing
  end

  execute "extract ruby-build" do
    cwd "/tmp/setup-ruby-build"
    command "tar xfz ruby-build.tar.gz"
  end

  execute "install ruby-build" do
    cwd "/tmp/setup-ruby-build/ruby-build"
    command "./install.sh" 
  end

end
