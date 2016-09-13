#
# Cookbook Name:: opsworks_cookbook_demo
# Recipe:: add_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
user "Add a user" do
  home "/home/jdoe"
  shell "/bin/bash"
  username "jdoe"
end
