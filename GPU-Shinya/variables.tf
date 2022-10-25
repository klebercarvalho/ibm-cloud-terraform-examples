variable "ibmcloud_region" {
    default = "us-south"
    description = "IBM Cloud region where your infrastructrure will be provisioned in"
}

variable "ibmcloud_api_key" {}

variable "resource_group" {
    default = "Default"
    description = "Desired resource group for the provisioned resources"
}

variable "ssh_key" {
    default = "ssh-key"
    description = "Insert the name of an existing SSH key for VPC"
}

variable "vpc_name" {
    default = "vpc"
    description = "Name of the new IBM Virtual Private Cloud Instance"
}

variable "cidr_zone_1" {
    default = "192.168.0.0/24"
    description = "Desired address prefix in CIDR notation"
}

variable "cidr_zone_2" {
    default = "192.168.64.0/24"
    description = "Desired address prefix in CIDR notation"
}

variable "cidr_zone_3" {
    default = "192.168.128.0/24"
    description = "Desired address prefix in CIDR notation"
}

variable "subnet_default_zone_1" {
  default = "192.168.0.0/24"
  description = "CIDR block for the address prefix."
}

variable "subnet_default_zone_2" {
  default = "192.168.64.0/24"
  description = "CIDR block for the address prefix."
}

variable "subnet_default_zone_3" {
  default = "192.168.128.0/24"
  description = "CIDR block for the address prefix."
}