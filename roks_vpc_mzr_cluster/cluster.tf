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
  name   = var.cluster_name
  flavor = "bx2.4x16"
  vpc_id = ibm_is_vpc.vpc1.id
  zones {
    name      = local.zone_1
    subnet_id = ibm_is_subnet.subnet1.id
  }
  zones {
    name      = local.zone_2
    subnet_id = ibm_is_subnet.subnet2.id
  }
  zones {
    name      = local.zone_3
    subnet_id = ibm_is_subnet.subnet3.id
  }

  /*****************
    OPTIONAL ARGUMENTS
    *****************/
  cos_instance_crn     = ibm_resource_instance.cos.id # REQUIRED FOR OPENSHIFT CLUSTERS
  kube_version         = "4.9.46_openshift"
  force_delete_storage = false
  wait_till            = "MasterNodeReady"
  worker_count         = 2
  resource_group_id    = data.ibm_resource_group.rg.id
  tags                 = ["estudo", "terraform", "schematics"]
}