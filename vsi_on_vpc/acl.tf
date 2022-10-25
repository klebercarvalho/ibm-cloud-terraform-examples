resource "ibm_is_network_acl_rule" "acl_inbound_rule1" {
    /*****************
    REQUIRED ARGUMENTS
    *****************/
    action      = "allow"
    destination = "0.0.0.0/0"
    direction   = "inbound"
    network_acl = ibm_is_network_acl.acl_default.id
    name        = "${ibm_is_subnet.subnet1.name}-${ibm_is_network_acl.acl_default.name}-inbound-rule1"
    source      = "0.0.0.0/0"
    /*****************
    OPTIONAL ARGUMENTS
    *****************/
    #before = ""

    /*icmp {
      code = 1
      type = 1
    }*/

    /*tcp {
        port_max        = (int)
        port_min        = (int)
        source_port_max = (int)
        source_port_min = (int)
    }*/

    /*udp {
        port_max        = (int)
        port_min        = (int)
        source_port_max = (int)
        source_port_min = (int)
    }*/
}

resource "ibm_is_network_acl_rule" "acl_outbound_rule1" {
    /*****************
    REQUIRED ARGUMENTS
    *****************/
    action      = "allow"
    destination = "0.0.0.0/0"
    direction   = "outbound"
    network_acl = ibm_is_network_acl.acl_default.id
    name        = "${ibm_is_subnet.subnet1.name}-${ibm_is_network_acl.acl_default.name}-outbound-rule1"
    source      = "0.0.0.0/0"
    /*****************
    OPTIONAL ARGUMENTS
    *****************/
    #before = ""

    /*icmp {
      code = 1
      type = 1
    }*/

    /*tcp {
        port_max        = (int)
        port_min        = (int)
        source_port_max = (int)
        source_port_min = (int)
    }*/

    /*udp {
        port_max        = (int)
        port_min        = (int)
        source_port_max = (int)
        source_port_min = (int)
    }*/
}

resource "ibm_is_network_acl" "acl_default" {
    /*****************
    REQUIRED ARGUMENTS
    *****************/
    name = "acl-${ibm_is_vpc.vpc1.name}"

    /*****************
    OPTIONAL ARGUMENTS
    *****************/
    resource_group = data.ibm_resource_group.rg.id
    #rules = [ibm_is_network_acl_rule.acl_inbound_rule1.id,ibm_is_network_acl_rule.acl_outbound_rule1.id]
    vpc = ibm_is_vpc.vpc1.id
    tags = ["estudo","schematics","terraform"]
}

resource "ibm_is_subnet_network_acl_attachment" "acl_attachment_subnet_1" {
    /*****************
    OPTIONAL ARGUMENTS
    *****************/
    subnet = ibm_is_subnet.subnet1.id
    network_acl = ibm_is_network_acl.acl_default.id
}