/*
*****************************************
PREREQUISITE RESOURCES
*****************************************
resource "ibm_is_vpc" "vpc1" {
    name = "example-vpc"
}

resource "ibm_is_subnet" "subnet1" {
    name            = "example-subnet"
    vpc             = ibm_is_vpc.vpc1.id
    zone            = "us-south-1"
    ipv4_cidr_block = "10.240.0.0/24"
}
****************************************
****************************************/

resource "ibm_container_vpc_cluster" "cluster" {
    /*****************
    REQUIRED ARGUMENTS
    *****************/
    name    = "mycluster"
    flavor  = "bx2.2x8"
    vpc_id  = ibm_is_vpc.vpc1.id
    zones {
        name        = "us-south-1"
        subnet_id   = ibm_is_subnet.subnet1.id
    }

    /*****************
    OPTIONAL ARGUMENTS
    *****************/
    #cos_instance_crn       = "" # REQUIRED FOR OPENSHIFT CLUSTERS
    force_delete_storage    = true
    wait_till               = "MasterNodeReady"
    #worker_count           = 2
    resource_group_id       = data.ibm_resource_group.rg.id
    tags                    = ["estudo","terraform","schematics"]
}