data "ibm_resource_group" "rg" {
    name = var.resource_group
}

data "ibm_is_ssh_key" "sshkey" {
    name = var.ssh_key
}

locals {
  zone_1 = "${var.region}-1"
  zone_2 = "${var.region}-2"
  zone_3 = "${var.region}-3"
}
