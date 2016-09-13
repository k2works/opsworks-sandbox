#
# Cookbook Name:: opsworks_cookbook_demo
# Recipe:: create_directory
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
directory "Create a directory" do
  group "root"
  mode "0755"
  owner "ec2-user"
  path "/tmp/create-directory-demo"
end
