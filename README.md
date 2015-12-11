This project demonstrates how to setup a simple multi-vm environment in Vagrant consisting of:

* nginx as load balancer
* two golang application servers

This requires Vagrant, Chef, and Virtualbox to be installed.

please make sure following Vagrant plugins installed 
 1. landrush
 2. vagrant-vbguest
 3. vagrant-berkshelf
 4. vagrant-share

To use this after installing all the prerequisites, just run 'vagrant up'.

Once vagrant deployment is completed please hit this url from your desktop machine :  http://web1.example.com

To redeploy application -> http://jenkin.example.com:8080/ 
