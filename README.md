This project demonstrates how to setup a simple multi-vm environment in Vagrant consisting of:

* nginx as load balancer
* two golang application servers

This requires Vagrant, Chef, and Virtualbox to be installed.

please make sure following Vagrant plugins installed 
 1. landrush
 2. vagrant-vbguest
 3. vagrant-berkshelf
 4. vagrant-share"
 5. vagrant-chef-zero 

To use this after installing all the prerequisites, just run 'vagrant up'.

Once vagrant deployment is completed try to open this into favorite browser http://web1.example.com
