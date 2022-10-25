resource "ibm_is_subnet" "subnets" {
  count                    = 3
  name                     = "mysubnet-${count.index + 1}"
  vpc                      = ibm_is_vpc.vpc1.id
  zone                     = "us-south-${count.index + 1}"
  total_ipv4_address_count = 256
}