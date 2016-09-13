#
# Cookbook Name:: opsworks_cookbook_demo
# Recipe:: run_command
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
execute "Create an SSH key" do
  command "ssh-keygen -f /tmp/my-key -N fLyC3jbY"
  not_if { File.exists?("/tmp/my-key") }
end
