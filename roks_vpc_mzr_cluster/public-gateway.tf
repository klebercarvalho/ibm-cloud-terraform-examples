resource "ibm_is_public_gateway" "vpc_public_gateway_zone_1" {
  /*****************
    REQUIRED ARGUMENTS
    *****************/
  name = "pg-${ibm_is_vpc.vpc1.name}-1"
  vpc  = ibm_is_vpc.vpc1.id
  zone = local.zone_1

  /*****************
    OPTIONAL ARGUMENTS
    *****************/
  /*floating_ip = [
        {
            id      = "floating_ip1_id"      # Do not specify "id" and "address" at the same time
            address = "floating_ip1_address" # Do not specify "id" and "address" at the same time
        }
        {
            id      = "floating_ip2_id"      # Do not specify "id" and "address" at the same time
            address = "floating_ip2_address" # Do not specify "id" and "address" at the same time
        }
    ]*/
  resource_group = data.ibm_resource_group.rg.id
  tags           = ["schematics", "estudo", "terraform"]
}

resource "ibm_is_public_gateway" "vpc_public_gateway_zone_2" {
  name           = "pg-${ibm_is_vpc.vpc1.name}-2"
  vpc            = ibm_is_vpc.vpc1.id
  zone           = local.zone_2
  resource_group = data.ibm_resource_group.rg.id
  tags           = ["schematics", "estudo", "terraform"]
}

resource "ibm_is_public_gateway" "vpc_public_gateway_zone_3" {
  name           = "pg-${ibm_is_vpc.vpc1.name}-3"
  vpc            = ibm_is_vpc.vpc1.id
  zone           = local.zone_3
  resource_group = data.ibm_resource_group.rg.id
  tags           = ["schematics", "estudo", "terraform"]
}

resource "ibm_is_subnet_public_gateway_attachment" "pg_attachment_1" {
  subnet         = ibm_is_subnet.subnet1.id
  public_gateway = ibm_is_public_gateway.vpc_public_gateway_zone_1.id
}

resource "ibm_is_subnet_public_gateway_attachment" "pg_attachment_2" {
  subnet         = ibm_is_subnet.subnet2.id
  public_gateway = ibm_is_public_gateway.vpc_public_gateway_zone_2.id
}

resource "ibm_is_subnet_public_gateway_attachment" "pg_attachment_3" {
  subnet         = ibm_is_subnet.subnet3.id
  public_gateway = ibm_is_public_gateway.vpc_public_gateway_zone_3.id
}