variable "vc_datacenter" {
  type = string
}

variable "vc_datastore" {
  type = string
}

variable "vc_cluster" {
  type = string
}

variable "vc_network" {
  type = string
}

variable "vc_template" {
  type = string
}

variable "vc_custom_spec" {
  type = string
}

variable "vc_folder" {
  type = string
}

variable "vms_app" {
  type = list(object({
    name   = string
    cpu    = number
    memory = number
  }))
}

variable "vms_lb" {
  type = list(object({
    name   = string
    cpu    = number
    memory = number
  }))
}

variable "ansible_inventory_template" {
  type = string
}

variable "ansible_inventory_file" {
  type = string
}
