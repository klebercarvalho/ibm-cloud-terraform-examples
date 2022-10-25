variable "ibmcloud_region" {
  default     = "us-south"
  description = "IBM Cloud region where your infrastructrure will be provisioned in"
}

variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key"
}

variable "resource_group" {
  default     = "RG-POC-DW"
  description = "Desired resource group for the provisioned resources"
}

variable "vpc_name" {
  default     = "vpc-cluster-poc-dw"
  description = "Desired name for the VPC"
}