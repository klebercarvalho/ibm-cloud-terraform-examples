resource "ibm_is_security_group" "vpc_security_group_default" {
    /*****************
    REQUIRED ARGUMENTS
    *****************/
    vpc  = ibm_is_vpc.vpc1.id

    /*****************
    OPTIONAL ARGUMENTS
    *****************/
    name = "${var.vpc_name}-sg-df"
    resource_group = data.ibm_resource_group.rg.id
    tags = ["estudo","schematics","terraform"]
}

resource "ibm_is_security_group_rule" "vpc_sg_inbound_rule1" {
    /*****************
    REQUIRED ARGUMENTS
    *****************/
    direction = "inbound"
    group = ibm_is_security_group.vpc_security_group_default.id

    /*****************
    OPTIONAL ARGUMENTS
    *****************/
    #ip_version = "IPv4"
    
    /*icmp {
        code = (int)
        type = (int)
    }*/

    #remote = 0.0.0.0

    /*tcp {
        port_min = (int)
        port_max = (int)
    }*/

    /*udp {
        port_min = (int)
        port_max = (int)
    }
    */
}

resource "ibm_is_security_group_rule" "vpc_sg_outbound_rule2" {
    direction = "outbound"
    group = ibm_is_security_group.vpc_security_group_default.id
}