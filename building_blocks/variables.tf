variable "ibmcloud_region" {
    default     = "us-south"
    description = "IBM Cloud region where your infrastructrure will be provisioned in"
}

variable "ibmcloud_api_key"{
    description = "Your IBM Cloud API key"
}

variable "resource_group" {
    default     = "Default"
    description = "Desired resource group for the provisioned resources"
}

variable "ssh_key" {
    description = "Insert the name of an existing SSH key for VPC"
}