name "jenkins"
description "CD/CI servers"
run_list "recipe[iptables::disabled]","recipe[ntp]","recipe[sshkeys-jenkins::default]","recipe[golang::packages]","recipe[jenkins::java]","recipe[jenkins::master]","recipe[jenkins::config]"
