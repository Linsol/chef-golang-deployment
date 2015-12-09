#
# Cookbook Name:: sshkeys
# Recipe:: default
#
#
cookbook_file '/home/vagrant/.ssh/id_rsa' do
  owner 'vagrant'
  group 'vagrant'
  mode '0600'
  action :create
  source 'id_rsa.key'
end

cookbook_file '/home/vagrant/.ssh/id_rsa.pub' do
  owner 'vagrant'
  group 'vagrant'
  mode '0644'
  action :create
  source 'id_rsa.pub'
end

cookbook_file '/home/vagrant/.ssh/authorized_keys' do
  owner 'vagrant'
  group 'vagrant'
  mode '0600'
  action :create
  source 'authorized_keys'
end
