resource "ibm_is_public_gateway" "vpc_public_gateway_zone_1" {
    /*****************
    REQUIRED ARGUMENTS
    *****************/
    name = "${ibm_is_vpc.vpc1.name}-pg-1"
    vpc = ibm_is_vpc.vpc1.id
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
    tags = ["schematics","estudo","terraform"]


}