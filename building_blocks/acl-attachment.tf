resource "ibm_is_subnet_network_acl_attachment" "acl_attachment_subnet_1" {
    /*****************
    OPTIONAL ARGUMENTS
    *****************/
    subnet = ibm_is_subnet.vpc_subnet1.id
    network_acl = ibm_is_network_acl.acl1.id
}