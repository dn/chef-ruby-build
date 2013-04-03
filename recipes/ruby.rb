#
# Cookbook Name:: ruby_build
# Recipe:: ruby
#
# Copyright (C) 2013 Daniel Nolte

unless File.exist? "/opt/rubies/ruby-2.0.0-p0/bin/ruby"

  directory "/opt/rubies/" do
    owner "root"
    group "root"
    mode  0755
    action :create
  end

  directory "/opt/ruby-builds/" do
    owner  "root"
    group  "root"
    mode   0755
    action :create
  end

  cookbook_file "/opt/ruby-builds/ruby-2.0.0-p0.tar.gz" do
    backup false
    action :create_if_missing
  end

  execute "install 2.0.0-p0" do
    environment ({ 'RUBY_BUILD_CACHE_PATH' => '/opt/ruby-builds' })
    command     "ruby-build 2.0.0-p0 /opt/rubies/ruby-2.0.0-p0"
  end

end
