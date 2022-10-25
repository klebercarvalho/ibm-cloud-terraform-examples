data "ibm_resource_group" "rg" {
  name = var.resource_group
}

locals {
  zone_1 = "${var.ibmcloud_region}-1"
  zone_2 = "${var.ibmcloud_region}-2"
  zone_3 = "${var.ibmcloud_region}-3"
}