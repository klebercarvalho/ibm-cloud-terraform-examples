resource "ibm_resource_instance" "cos" {
  name              = "test"
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
  resource_group_id = data.ibm_resource_group.rg.id
  tags              = ["tag1", "tag2"]
}