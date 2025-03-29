[webservers]
%{ for vm in vms_app ~}
${vm}
%{ endfor ~}

[loadbalancers]
%{ for vm in vms_lb ~}
${vm}
%{ endfor ~}

[all:vars]
ansible_connection='ssh'
ansible_ssh_port='22'
