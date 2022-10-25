resource "ibm_container_vpc_cluster" "cluster" {
  /*****************
    REQUIRED ARGUMENTS
    *****************/
  name   = var.cluster_name
  flavor = "bx2.2x8"
  vpc_id = ibm_is_vpc.vpc1.id
  zones {
    name      = local.zone_1
    subnet_id = ibm_is_subnet.subnet1.id
  }

  /*****************
    OPTIONAL ARGUMENTS
    *****************/
  #cos_instance_crn       = "" # REQUIRED FOR OPENSHIFT CLUSTERS
  force_delete_storage = true
  wait_till            = "MasterNodeReady"
  #worker_count           = 3
  resource_group_id = data.ibm_resource_group.rg.id
  tags              = ["estudo", "terraform", "schematics"]
}