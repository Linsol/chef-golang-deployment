name "load_balancer"
description "load balancer using nginx"
run_list "recipe[ntp]","recipe[yum::epel]","recipe[nginx::default]","recipe[loadbalancer]","recipe[iptables::disabled]"
