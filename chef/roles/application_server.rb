name "application_server"
description "go application server"
run_list "recipe[iptables::disabled]","recipe[ntp]","recipe[sshkeys::default]","recipe[golang::packages]","recipe[goapp]"
