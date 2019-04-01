data "ibm_compute_ssh_key" "deploymentKey" {
  label = "ryan_tycho"
}

resource "random_id" "name" {
  byte_length = 4
}

resource "ibm_compute_vm_instance" "node" {
  hostname                  = "${random_id.name.hex}-tf"
  domain                    = "${var.domain}"
  os_reference_code         = "${var.os_reference_code}"
  datacenter                = "${var.datacenter}"
  network_speed             = 1000
  hourly_billing            = true
  private_network_only      = false
  flavor_key_name           = "${var.flavor_key_name}"
  disks                     = [200]
  local_disk                = false
  public_vlan_id            = "${var.public_vlan_id}"
  private_vlan_id           = "${var.private_vlan_id}"
}
