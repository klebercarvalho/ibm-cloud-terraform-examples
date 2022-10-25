resource "ibm_cr_namespace" "cr_namespace" {
  name              = "cr-roks"
  resource_group_id = data.ibm_resource_group.rg.id
}