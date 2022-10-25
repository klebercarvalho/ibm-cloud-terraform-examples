resource "ibm_is_vpc" "vpc1" {
  /*******************
    * REQUIRED ARGUMENTS
    *******************/
  name = var.vpc_name

  /*******************
    * OPTIONAL ARGUMENTS
    *******************/
  #address_prefix_management   = ["auto"|"manual"] <indicate whether to create address prefixes automatically or manually>
  #classic_access              = [true|false] <enable_access_to_classic_infrastructure>
  #default_network_acl_name    = <name of the default access control list (ACL)>
  #default_security_group_name = <name of the default security group>
  #defautl_routing_table_name  = <name of the default routing table>
  resource_group = data.ibm_resource_group.rg.id
  #tags                        = [<enter_the_desired>, <tags>]
}