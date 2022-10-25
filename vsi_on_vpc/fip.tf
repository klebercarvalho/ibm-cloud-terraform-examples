resource "ibm_is_floating_ip" "vsi_fip" {
    name           = "${ibm_is_vpc.vpc1.name}-${ibm_is_instance.vsi1.name}-fip-01"
    resource_group = data.ibm_resource_group.rg.id
    tags           = ["estudo","terraform","schematics"]
    target         = ibm_is_instance.vsi1.primary_network_interface[0].id
}