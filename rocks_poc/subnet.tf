resource "ibm_is_subnet" "subnet1" {
  /*****************
    REQUIRED ARGUMENTS
    *****************/
  name = "${var.vpc_name}-subnet-1"
  vpc  = ibm_is_vpc.vpc1.id

  /*****************
    OPTIONAL ARGUMENTS
    *****************/
  #access_tags              = ["","",...,""]
  # ipv4_cidr_block           = "10.240.0.0/24"
  #ip_version               = "ipv4"
  #network_acl              = ""
  #public_gateway           = ""
  resource_group = data.ibm_resource_group.rg.id
  #routing_table            = ""
  tags                     = ["estudo", "terraform", "schematics"]
  total_ipv4_address_count = 256
  zone                     = local.zone_1
}

resource "ibm_is_subnet" "subnet2" {
  name                     = "${var.vpc_name}-subnet-2"
  vpc                      = ibm_is_vpc.vpc1.id
  resource_group           = data.ibm_resource_group.rg.id
  total_ipv4_address_count = 256
  zone                     = local.zone_2

}

resource "ibm_is_subnet" "subnet3" {
  name                     = "${var.vpc_name}-subnet-3"
  vpc                      = ibm_is_vpc.vpc1.id
  resource_group           = data.ibm_resource_group.rg.id
  total_ipv4_address_count = 256
  zone                     = local.zone_3

}