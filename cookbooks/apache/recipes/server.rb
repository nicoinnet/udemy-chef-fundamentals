#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# Make sure apache is installed.
package 'httpd'

remote_file '/var/www/html/guitar.png' do
  source 'http://www.guitaraficionado.com/wp-content/uploads/2011/11/edit390FenderHendrix.high.jpg'
end

# Make sure index web page gets created.
template '/var/www/html/index.html' do
  source 'index.html.erb'
  action :create
end

directory "/var/www/mysites" do
  owner 'apache'
  recursive true
end

# Make sure apache server is enabled at startup and started.
service 'httpd' do
  action [:enable, :start]
end
