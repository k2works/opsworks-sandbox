#!/usr/bin/env bash

berks install
berks package opsworks_cookbook_demo.tar.gz
#aws s3 cp opsworks_cookbook_demo.tar.gz s3://k2works-opsworks-demo-bucket/opsworks_cookbook_demo.tar.gz
aws s3 cp opsworks_cookbook_demo.tar.gz s3://opsworks-cookbook-demo-20160913/opsworks_cookbook_demo.tar.gz
rm opsworks_cookbook_demo.tar.gz
