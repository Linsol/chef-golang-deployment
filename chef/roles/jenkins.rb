name "jenkins"
description "CD/CI servers"
run_list "recipe[yum::epel]","recipe[iptables::disabled]","recipe[ntp]","recipe[ansible::install]","recipe[golang::packages]","recipe[jenkins::java]","recipe[jenkins::master]","recipe[sshkeys-jenkins::default]","recipe[jenkins::config]"
