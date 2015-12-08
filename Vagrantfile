# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"


unless Vagrant.has_plugin?("landrush")
  raise 'landrush plugin is required'
end

unless Vagrant.has_plugin?("vagrant-vbguest")
  raise 'vagrant-vbguest plugin is required'
end

unless Vagrant.has_plugin?("vagrant-berkshelf")
  raise 'vagrant-berkshelf plugin is required'
end

unless Vagrant.has_plugin?("vagrant-share")
  raise 'vagrant-share plugin is required'
end

unless Vagrant.has_plugin?("vagrant-chef-zero")
  raise 'vagrant-chef-zero plugin is required'
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Top level domain
  $tld = "example.com"
  config.ssh.insert_key = false
  config.landrush.enabled = true
  config.landrush.tld = $tld
  config.landrush.guest_redirect_dns = false
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
  # Application server 1.
  config.vm.define "app1" do |app|
    app.vm.hostname = "app1." + $tld
    app.vm.box = "puppetlabs/centos-6.6-64-puppet"
    app.vm.network :private_network, ip: "192.168.60.110"
    app.landrush.host 'app1.example.com', '192.168.60.110'
    app.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = "chef/cookbooks"
        chef.roles_path = "chef/roles"
        chef.add_role "application_server"
      end
  end

  # Application server 2.
  config.vm.define "app2" do |app|
    app.vm.hostname = "app2."+ $tld
    app.vm.box = "puppetlabs/centos-6.6-64-puppet"
    app.vm.network :private_network, ip: "192.168.60.111"
    app.landrush.host 'app2.example.com', '192.168.60.111'

    app.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = "chef/cookbooks"
        chef.roles_path = "chef/roles"
        chef.add_role "application_server"
      end
  end

    # web server 1.
  config.vm.define "web1" do |web|
    web.vm.hostname = "web1." + $tld
    web.vm.box = "puppetlabs/centos-6.6-64-puppet"
    web.vm.network :private_network, ip: "192.168.60.100"
    web.landrush.host 'web1.example.com', '192.168.60.100'
    web.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "chef/cookbooks"
      chef.roles_path = "chef/roles"
      chef.add_role "load_balancer"
      chef.json = {
        'loadbalancer' => {
          'upstream_servers' => ['192.168.60.110:8484','192.168.60.111:8484']
        }
      }
    end
  end
end

