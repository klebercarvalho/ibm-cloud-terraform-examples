provider "ibm" {
  /*****************
    OPTIONAL ARGUMENTS
    *****************/
  ibmcloud_api_key = var.ibmcloud_api_key
  #ibmcloud_timeout          = 60
  #iaas_classic_username     = ""
  #iaas_classic_api_key      = ""
  #iaas_classic_endpoint_url = ""
  #softlayer_timeout         = seconds #Higher precedence
  #iaas_classic_timeout      = seconds #Lower precedence
  region         = var.ibmcloud_region
  resource_group = var.resource_group
  #max_retries               = 10
  #function_namespace        = <org\>_<space\>
  #zone                      = ""
  #visibility                = (public|private|public_and_private)
}