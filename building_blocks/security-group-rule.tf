resource "ibm_is_security_group_rule" "vpc_sg_df" {
    /*****************
    REQUIRED ARGUMENTS
    *****************/
    direction = "inbound"
    group = ibm_is_security_group.vpc1.vpc_security_group_default.id

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