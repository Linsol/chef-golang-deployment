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

directory '/var/lib/jenkins/.ssh' do
  owner 'jenkins'
  group 'jenkins'
  mode '700'
  action :create
end

cookbook_file '/var/lib/jenkins/.ssh/id_rsa' do
  owner 'jenkins'
  group 'jenkins'
  mode '0600'
  action :create
  source 'id_rsa.key'
end

cookbook_file '/var/lib/jenkins/.ssh/id_rsa.pub' do
  owner 'jenkins'
  group 'jenkins'
  mode '0644'
  action :create
  source 'id_rsa.pub'
end

cookbook_file '/var/lib/jenkins/.ssh/authorized_keys' do
  owner 'jenkins'
  group 'jenkins'
  mode '0600'
  action :create
  source 'authorized_keys'
end

directory '/root/.ssh' do
  owner 'root'
  group 'root'
  mode '700'
  action :create
end

cookbook_file '/root/.ssh/id_rsa' do
  owner 'root'
  group 'root'
  mode '0600'
  action :create
  source 'id_rsa.key'
end

cookbook_file '/root/.ssh/id_rsa.pub' do
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  source 'id_rsa.pub'
end

cookbook_file '/root/.ssh/authorized_keys' do
  owner 'root'
  group 'root'
  mode '0600'
  action :create
  source 'authorized_keys'
end

