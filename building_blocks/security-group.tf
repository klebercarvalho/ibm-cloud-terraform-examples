resource "ibm_is_security_group" "vpc-sg-df" {
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