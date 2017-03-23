#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# Make sure apache is installed.
package 'httpd'

# Make sure index web page gets created.
file '/var/www/html/index.html' do
  content '<html><body><h1>Hello World!</h1></body></html>'
  action :create
end

# Make sure apache server is enabled at startup and started.
service 'httpd' do
  action [:enable, :start]
end
