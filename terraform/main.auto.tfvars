vc_datacenter  = "CIT"
vc_datastore   = "xEMC01_1_4_as"
vc_cluster     = "zabedu"
vc_network     = "pgWeb"
vc_template    = "tmp-ubuntu22"
vc_custom_spec = "tmp-ubuntu-tf"
vc_folder      = "/AS/TF"

vms_app = [
  {
    name   = "as-apphost-01",
    cpu    = 4,
    memory = 4096
  },
  {
    name   = "as-apphost-02",
    cpu    = 4,
    memory = 4096
  }
]

vms_lb = [
  {
    name   = "as-applb",
    cpu    = 2,
    memory = 2048
  }
]

ansible_inventory_template = "../ansible/inventory.tpl"
ansible_inventory_file     = "../ansible/inventory.ini"
