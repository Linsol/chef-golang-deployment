package 'ansible' do
  version node['ansible']['version']
  action :install
end
