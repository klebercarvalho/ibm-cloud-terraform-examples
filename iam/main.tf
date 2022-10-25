resource "ibm_iam_access_group" "ag_terraform" {
  name        = "AG-terraform"
  description = "Grupo de acesso criado pelo terraform"
}

resource "ibm_iam_service_id" "serviceID" {
  name = "testserviceid"
}

resource "ibm_iam_trusted_profile" "profileID" {
  name = "testprofileid"
}

resource "ibm_iam_access_group_members" "ag_terraform_members" {
  access_group_id = ibm_iam_access_group.ag_terraform.id
  ibm_ids         = var.users
  iam_service_ids = [ibm_iam_service_id.serviceID.id]
  iam_profile_ids = [ibm_iam_trusted_profile.profileID.id]
}

resource "ibm_iam_access_group_policy" "polic01" {
  access_group_id = ibm_iam_access_group.ag_terraform.id
  roles           = ["Viewer"]
  resources {
    service_type = "service"
    region       = "us-south"
  }
}

resource "ibm_iam_access_group_policy" "policy02" {
  access_group_id = ibm_iam_access_group.ag_terraform.id
  roles           = ["Editor"]
  resources {
    service = "containers-kubernetes"
  }
}