#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# Make sure apache is installed.
package 'httpd'

cookbook_file '/var/www/html/index.html' do
  source 'index.html'
end

# Make sure apache server is enabled at startup and started.
service 'httpd' do
  action [:enable, :start]
end
