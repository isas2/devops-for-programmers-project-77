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

data "ansiblevault_path_pattern" "datadog_api_key" {
  path_params = { type = "datadog" }
  key         = "datadog_api_key"
}

data "ansiblevault_path_pattern" "datadog_app_key" {
  path_params = { type = "datadog" }
  key         = "datadog_app_key"
}

data "ansiblevault_path_pattern" "datadog_domain" {
  path_params = { type = "datadog" }
  key         = "datadog_domain"
}
