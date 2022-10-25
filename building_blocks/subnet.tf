resource "ibm_is_subnet" "subnet1" {
    /*****************
    REQUIRED ARGUMENTS
    *****************/
    name = "example-subnet"
    vpc  = ibm_is_vpc.vpc1.id
    
    /*****************
    OPTIONAL ARGUMENTS
    *****************/
    #access_tags              = ["","",...,""]
    ipv4_cidr_block           = "10.240.0.0/24"
    #ip_version               = "ipv4"
    #network_acl              = ""
    #public_gateway           = ""
    resource_group            = data.ibm_resource_group.rg.id
    #routing_table            = ""
    tags                      = ["estudo","terraform","schematics"]
    #total_ipv4_address_count = ""
    zone                      = "us-south-1"
}