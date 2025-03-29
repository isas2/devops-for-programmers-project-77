data "vsphere_datacenter" "datacenter" {
  name = var.vc_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vc_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vc_cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.vc_network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vc_template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_guest_os_customization" "linux" {
  name = var.vc_custom_spec
}

resource "vsphere_virtual_machine" "vm_app" {
  count            = length(var.vms_app)
  name             = var.vms_app[count.index].name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = var.vc_folder
  num_cpus         = var.vms_app[count.index].cpu
  memory           = var.vms_app[count.index].memory
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = "Hard Disk 1"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customization_spec {
      id = data.vsphere_guest_os_customization.linux.id
    }
  }
}

resource "vsphere_virtual_machine" "vm_lb" {
  count            = length(var.vms_lb)
  name             = var.vms_lb[count.index].name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = var.vc_folder
  num_cpus         = var.vms_lb[count.index].cpu
  memory           = var.vms_lb[count.index].memory
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = "Hard Disk 1"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customization_spec {
      id = data.vsphere_guest_os_customization.linux.id
    }
  }
}

resource "local_file" "ansible_inventory" {
  content = templatefile(var.ansible_inventory_template,
    {
      vms_app = [for vm in vsphere_virtual_machine.vm_app : "${vm.default_ip_address} hostname=${vm.name}"]
      vms_lb  = [for vm in vsphere_virtual_machine.vm_lb : "${vm.default_ip_address} hostname=${vm.name}"]
    }
  )
  filename = var.ansible_inventory_file
  provisioner "local-exec" {
    command = "chmod 644 ${var.ansible_inventory_file}"
  }
}
