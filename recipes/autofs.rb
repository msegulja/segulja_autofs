#
# Cookbook:: segulja_autofs
# Recipe:: autofs
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Install the autofs package
# Start and enable the autofs package
# Copy the auto.master, auto.direct, and auto.home templates
# Reload autofs if any of the files are changed

package 'autofs' do
  action :install
end

service 'autofs' do
  action [:enable, :start]
end

cookbook_file '/etc/auto.master' do
  source 'auto.master'
  owner 'root'
  group 'root'
  mode '0600'
  action :create
  notifies :restart, 'service[autofs]', :immediately
end

cookbook_file '/etc/auto.direct' do
  source 'auto.direct'
  owner 'root'
  group 'root'
  mode '0600'
  action :create
  notifies :restart, 'service[autofs]', :immediately
end

cookbook_file '/etc/auto.home' do
  source 'auto.home'
  owner 'root'
  group 'root'
  mode '0600'
  action :create
  notifies :restart, 'service[autofs]', :immediately
end
