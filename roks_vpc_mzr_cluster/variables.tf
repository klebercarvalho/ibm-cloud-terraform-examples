variable "ibmcloud_region" {
  default     = "us-south"
  description = "IBM Cloud region where your infrastructrure will be provisioned in"
}

variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key"
}

variable "resource_group" {
  default     = "Default"
  description = "Desired resource group for the provisioned resources"
}

variable "vpc_name" {
  default     = "vpc-cluster"
  description = "Desired name for the VPC"
}

variable "cluster_name" {
  type        = string
  default     = "roks-mzr-cluster"
  description = "Desired name for your cluster"
}