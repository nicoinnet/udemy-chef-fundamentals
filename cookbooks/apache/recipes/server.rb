#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# Make sure apache is installed.
package 'httpd'

# Make sure index web page gets created.
template '/var/www/html/index.html' do
  source 'index.html.erb'
  action :create
end

# Make sure apache server is enabled at startup and started.
service 'httpd' do
  action [:enable, :start]
end
