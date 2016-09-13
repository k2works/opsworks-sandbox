#
# Cookbook Name:: opsworks_cookbook_demo
# Recipe:: add_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
%w[ec2-user jdoe].each do |user|
  user "Add a user" do
    home "/home/#{user}"
    shell "/bin/bash"
    username "#{user}"
  end
end
