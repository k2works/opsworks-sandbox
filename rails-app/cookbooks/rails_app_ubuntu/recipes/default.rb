#
# Cookbook Name:: rails_app_ubuntu
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'apt::default'

include_recipe 'curl::default'

git_client 'default' do
  action :install
end

%w{
  build-essential
  libsqlite3-dev
  nodejs
}.each do |package|
  package "#{package}" do
    action :install
  end
end

git "/srv/myapp" do
  repository 'https://github.com/k2works/opsworks-sandbox-rails-app.git'
  revision "master"
  action :sync
end

ruby_runtime 'myapp' do
  provider :ruby_build
  version '2.3'
end

application '/srv/myapp' do
  ruby '2.3'
  bundle_install do
    deployment true
    without %w{development test}
  end
  rails do
    database 'sqlite3:///db.sqlite3'
    secret_token 'd78fe08df56c9'
    migrate true
  end
  unicorn do
    port 8000
  end
end
