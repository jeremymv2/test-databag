#
# Cookbook Name:: test-databag
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
#
item = Chef::DataBagItem.load('jenkins', 'dev0')
server_types = ["servertype_citrixserver", "servertype_webserver"]
mytype = 'unknown'

server_types.each do |t|
  item[t].each do |u|
    if u.has_key? 'hostname'
      if u['hostname'] == node['name']
        mytype = t
#        puts "I am a server of type #{t}"
      end
    end
  end
end

file "/tmp/#{mytype}"
