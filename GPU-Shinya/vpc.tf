resource "ibm_is_vpc" "vpc" {
    address_prefix_management = "manual"
    default_routing_table_name = "rt-${var.vpc_name}"
    name = var.vpc_name
    resource_group = data.ibm_resource_group.default.id
    tags = ["schematics"]
}

resource "ibm_is_vpc_address_prefix" "vpc_address_prefix_zone_1" {
    cidr = var.cidr_zone_1
    name = "ap-${ibm_is_vpc.vpc.name}-zone-1"
    vpc = ibm_is_vpc.vpc.id
    zone = local.zone_1
}

resource "ibm_is_vpc_address_prefix" "vpc_address_prefix_zone_2" {
    cidr = var.cidr_zone_2
    name = "ap-${ibm_is_vpc.vpc.name}-zone-2"
    vpc = ibm_is_vpc.vpc.id
    zone = local.zone_2
}

resource "ibm_is_vpc_address_prefix" "vpc_address_prefix_zone_1" {
    cidr = var.cidr_zone_3
    name = "ap-${ibm_is_vpc.vpc.name}-zone-3"
    vpc = ibm_is_vpc.vpc.id
    zone = local.zone_3
}

resource "ibm_is_public_gateway" "vpc_public_gateway_zone_1" {
  name = "${ibm_is_vpc.vpc.name}-pg-1"
  resource_group = data.ibm_resource_group.default.id
  tags = ["schematics"]
  vpc = ibm_is_vpc.vpc.id
  zone = local.zone_1
}

resource "ibm_is_public_gateway" "vpc_public_gateway_zone_2" {
  name = "${ibm_is_vpc.vpc.name}-pg-2"
  resource_group = data.ibm_resource_group.default.id
  tags = ["schematics"]
  vpc = ibm_is_vpc.vpc.id
  zone = local.zone_2
}

resource "ibm_is_public_gateway" "vpc_public_gateway_zone_3" {
  name = "${ibm_is_vpc.vpc.name}-pg-3"
  resource_group = data.ibm_resource_group.default.id
  tags = ["schematics"]
  vpc = ibm_is_vpc.vpc.id
  zone = local.zone_3
}

resource "ibm_is_subnet" "vpc_subnet_default_1" {
  ipv4_cidr_block = var.subnet_default_zone_1
  name = "${ibm_is_vpc.vpc.name}-sn-1"
  public_gateway = ibm_is_public_gateway.vpc_public_gateway_zone_1.id
  resource_group = data.ibm_resource_group.default.id
  tags = ["schematics"]
  vpc = ibm_is_vpc.vpc.id
  zone = local.zone_1
}

resource "ibm_is_subnet" "vpc_subnet_default_2" {
  ipv4_cidr_block = var.subnet_default_zone_2
  name = "${ibm_is_vpc.vpc.name}-sn-2"
  public_gateway = ibm_is_public_gateway.vpc_public_gateway_zone_2.id
  resource_group = data.ibm_resource_group.default.id
  tags = ["schematics"]
  vpc = ibm_is_vpc.vpc.id
  zone = local.zone_2
}

resource "ibm_is_subnet" "vpc_subnet_default_3" {
  ipv4_cidr_block = var.subnet_default_zone_3
  name = "${ibm_is_vpc.vpc.name}-sn-3"
  public_gateway = ibm_is_public_gateway.vpc_public_gateway_zone_3.id
  resource_group = data.ibm_resource_group.default.id
  tags = ["schematics"]
  vpc = ibm_is_vpc.vpc.id
  zone = local.zone_3
}

resource "ibm_is_network_acl" "acl_default" {
  name = "acl-${ibm_is_vpc.vpc.name}"
  resource_group = data.ibm_resource_group.default.id
  rules {
    action = "allow"
    destination = "0.0.0.0/0"
    direction = "inbound"
    icmp {
      code = 1
      type = 1
    }
    name = "inbound"
    source = "0.0.0.0/0"
  }
  rules {
    action = "allow"
    destination = "0.0.0.0/0"
    direction = "outbound"
    icmp {
      code = 1
      type = 1
    }
    name = "outbound"
    source = "0.0.0.0/0"
  }
  vpc = ibm_is_vpc.vpc.id
}

resource "ibm_is_subnet_network_acl_attachment" "acl_attachment_subnet_1" {
  subnet = ibm_is_subnet.vpc_subnet_default_1.id
  network_acl = ibm_is_network_acl.acl_default.id
}

resource "ibm_is_subnet_network_acl_attachment" "acl_attachment_subnet_2" {
  subnet = ibm_is_subnet.vpc_subnet_default_2.id
  network_acl = ibm_is_network_acl.acl_default.id
}

resource "ibm_is_subnet_network_acl_attachment" "acl_attachment_subnet_3" {
  subnet = ibm_is_subnet.vpc_subnet_default_3.id
  network_acl = ibm_is_network_acl.acl_default.id
}
