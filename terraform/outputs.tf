output "vms-app" {
  description = "App VMs hostnames and IPs"
  value       = { for vm in vsphere_virtual_machine.vm_app: vm.name => vm.default_ip_address }
}

output "vms-lb" {
  description = "LB VMs hostnames and IPs"
  value       = { for vm in vsphere_virtual_machine.vm_lb: vm.name => vm.default_ip_address }
}
