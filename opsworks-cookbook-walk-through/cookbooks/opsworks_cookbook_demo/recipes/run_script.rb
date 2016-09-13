#
# Cookbook Name:: opsworks_cookbook_demo
# Recipe:: run_script
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
script "Run a script" do
  interpreter "bash"
  code <<-EOH
    mkdir -m 777 /tmp/run-script-demo
    touch /tmp/run-script-demo/helloworld.txt
    echo "Hello, World!" > /tmp/run-script-demo/helloworld.txt
  EOH
end
