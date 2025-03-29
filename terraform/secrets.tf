data "ansiblevault_path_pattern" "vsphere_server" {
  path_params = { type = "vsphere" }
  key         = "vsphere_server"
}

data "ansiblevault_path_pattern" "vsphere_user" {
  path_params = { type = "vsphere" }
  key         = "vsphere_user"
}

data "ansiblevault_path_pattern" "vsphere_password" {
  path_params = { type = "vsphere" }
  key         = "vsphere_password"
}
