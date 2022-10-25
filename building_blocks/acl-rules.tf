resource "ibm_is_network_acl_rule" "acl_inbound_rule1" {
    /*****************
    REQUIRED ARGUMENTS
    *****************/
    action      = "allow"
    destination = "0.0.0.0/0"
    direction   = "inbound"
    network_acl = ibm_is_network_acl.acl1.id
    name        = "${ibm_is_subnet.subnet1.name}-${ibm_is_network_acl.acl1.name}-inbound-rule1"
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
    network_acl = ibm_is_network_acl.acl1.id
    name        = "${ibm_is_subnet.subnet1.name}-${ibm_is_network_acl.acl1.name}-outbound-rule1"
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
