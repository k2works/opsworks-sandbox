#!/usr/bin/env bash

tar -czvf opsworks_cookbook_demo.tar.gz opsworks_cookbook_demo/
aws s3 cp opsworks_cookbook_demo.tar.gz s3://k2works-opsworks-demo-bucket/opsworks_cookbook_demo.tar.gz

