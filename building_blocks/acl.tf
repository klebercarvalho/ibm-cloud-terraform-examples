resource "ibm_is_network_acl" "acl1" {
    /*****************
    REQUIRED ARGUMENTS
    *****************/
    name = "acl-${ibm_is_vpc.vpc.name}"

    /*****************
    OPTIONAL ARGUMENTS
    *****************/
    resource_group = data.ibm_resource_group.default.id
    rules [ibm_is_network_acl_rule.acl_inbound_rule1.id,ibm_is_network_acl_rule.acl_outbound_rule1.id]
    vpc = ibm_is_vpc.vpc1.id
    tags = ["estudo","schematics","terraform"]
}