#
# Cookbook Name:: goapp
# Recipe:: default
#
#
include_recipe 'golang'

directory '/opt/goapp/' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/opt/goapp/app.go' do
  owner 'root'
  group 'root'
  action :create
  source 'app.go'
end

cookbook_file '/opt/goapp/run.sh' do
  owner 'root'
  group 'root'
  action :create
  source 'run.sh'
  mode '0755'
end

execute 'goapp-build-run' do
  command 'cd /opt/goapp/ ;sh run.sh'
end

cookbook_file '/etc/init.d/goapp' do
  owner 'root'
  group 'root'
  action :create
  source 'goapp.initd'
  mode '0755'
end

execute 'goapp-init' do
  command 'chkconfig --add goapp'
end

service "goapp" do
      supports :restart => true, :start => true, :stop => true, :reload => true
      action [ :enable, :start]
end
