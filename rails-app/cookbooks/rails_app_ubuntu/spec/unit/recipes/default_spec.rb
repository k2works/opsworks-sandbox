#
# Cookbook Name:: rails_app_ubuntu
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

shared_examples 'rails_app_ubuntu' do |platform, version, package|
  context "when run on #{platform} #{version}" do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: platform, version: version)
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it "installs #{package}" do
      expect(chef_run).to install_package package
    end
  end
end

describe 'rails_app_ubuntu::default' do
  platforms = {
      'ubuntu' => ['14.04','apt-transport-https','curl','build-essential','libsqlite3-dev','nodejs']
  }

  platforms.each do |platform, platform_data|
    include_examples 'rails_app_ubuntu', platform, *platform_data
  end
end
