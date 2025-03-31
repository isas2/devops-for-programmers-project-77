terraform {
  required_version = ">= 0.13"

  required_providers {

    ansiblevault = {
      source  = "MeilleursAgents/ansiblevault"
      version = "~> 3.0.1"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }

    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.11.1"
    }

    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.58.0"
    }
  }
}

provider "ansiblevault" {
  path_pattern = "./secrets/{{.type}}.yml"
  vault_path   = "../ansible/.vault_pas"
  root_folder  = "./"
}

provider "vsphere" {
  user                 = data.ansiblevault_path_pattern.vsphere_user.value
  password             = data.ansiblevault_path_pattern.vsphere_password.value
  vsphere_server       = data.ansiblevault_path_pattern.vsphere_server.value
  allow_unverified_ssl = true
  api_timeout          = 10
}

provider "datadog" {
  api_key = data.ansiblevault_path_pattern.datadog_api_key.value
  app_key = data.ansiblevault_path_pattern.datadog_app_key.value
  api_url = "https://api.${data.ansiblevault_path_pattern.datadog_domain.value}/"
}
