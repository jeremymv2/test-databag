#
# Cookbook Name:: test-databag
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'test-databag::default' do
  include ChefVault::TestFixtures.rspec_shared_context
  context "When server type from data_bag is 'servertype_citrixserver'" do
    let(:hostname) do
      'jonsnow'
    end

    let(:chef_run) do
      ChefSpec::ServerRunner.new() do |node, server|
        server.create_data_bag('jenkins', {
          'dev0' => parse_data_bag('jenkins/dev0.json')
        })
        node.set['name'] = hostname
      end.converge(described_recipe)
    end

    let(:node) do
      chef_run.node
    end

    it 'sees the nodename correctly' do
      attribute = node['name']
      expect(attribute).to eq hostname
    end

    it 'creates the appropriate file /tmp/servertype_citrixserver' do
      expect(chef_run).to create_file('/tmp/servertype_citrixserver')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  context "When server type from data_bag is 'servertype_webserver'" do
    let(:hostname) do
      'gregorclegane'
    end

    let(:chef_run) do
      ChefSpec::ServerRunner.new() do |node, server|
        server.create_data_bag('jenkins', {
          'dev0' => parse_data_bag('jenkins/dev0.json')
        })
        node.set['name'] = hostname
      end.converge(described_recipe)
    end

    let(:node) do
      chef_run.node
    end

    it 'sees the nodename correctly' do
      attribute = node['name']
      expect(attribute).to eq hostname
    end

    it 'creates the appropriate file /tmp/servertype_webserver' do
      expect(chef_run).to create_file('/tmp/servertype_webserver')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
