data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}

resource "ibm_container_vpc_cluster" "cluster" {
  name              = "mycluster"
  vpc_id            = ibm_is_vpc.vpc1.id
  flavor            = "bx2.4x16"
  worker_count      = 1
  resource_group_id = data.ibm_resource_group.resource_group.id
  dynamic "zones" {
    for_each = ibm_is_subnet.subnets
    content {
      subnet_id = zones.value.id
      name      = zones.value.zone
    }
  }
  wait_till            = "MasterNodeReady"
  force_delete_storage = true
}
/*
resource "ibm_container_vpc_worker_pool" "cluster_pool" {
  cluster           = ibm_container_vpc_cluster.cluster.id
  worker_pool_name  = "mywp"
  flavor            = "bx2.2x8"
  vpc_id            = ibm_is_vpc.vpc1.id
  worker_count      = 3
  resource_group_id = data.ibm_resource_group.resource_group.id
  zones {
    name      = "us-south-2"
    subnet_id = ibm_is_subnet.subnet2.id
  }
}
*/