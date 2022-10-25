
# Example Compute Virtual Server Instance for VPC environment


This Terraform example for IBM Cloud Schematics illustrates how to deploy a VSI on IBM Cloud VPC environment with a subnet, security group and floating IP.

This Terraform template does the following actions:
1. Create a VPC environment on IBM Cloud.
2. Create a Subnet associated with a network ACL to limit the subnet’s inbound and outbound traffic.
3. Create a VSI associated with security group on VPC environment.
4. Create a Public Gateway to access the internet from the VSI.
5. Reserves a floating IP to access the VSI.

## VSI on VPC environment architecture diagram
![architecture-diagram-vsi-tf](https://media.github.ibm.com/user/398248/files/30d03700-27b1-11ed-9d41-949d49203d46)

## Prerequisites
- Create an IBM Cloud account.

## Deploy on IBM Cloud using IBM Cloud Schematics
You can use IBM Cloud Schematics to deploy this Terraform template in the cloud without having a local terraform configuration.
For this, complete the following steps:

### 1. Create an IBM Cloud Schematics workspace on your IBM Cloud account.
  
   1.1. Insert the GitHub repository URL: https://github.ibm.com/vmcabredo/exemplos_terraform/tree/main/vsi_on_vpc
   
   1.2. Insert the Personal Access Token to authenticate with this private GitHub repository.
  
   1.3. Isn't necessary to use full repository, so you can disable the check box.
  
   1.4. For Terraform version you can select terraform_v1.1, the version that was used in this example.
  
  <img src="https://media.github.ibm.com/user/398248/files/da273380-286a-11ed-810f-da706b99e61b" width="600">
  
   1.5. Insert a name for your workspace, as example: myworkspace-terraform.

   1.6. You can put tags for your workspace, as an example we put "terraform".

   1.7. You can select a resource group.

   1.8. Then, finally, you can choose the location and create the workspace.
   
  <img src="https://media.github.ibm.com/user/398248/files/676d8680-2871-11ed-883e-430ef67bb9cb" width="600">
  
### 2. Set variables
  
  2.1. As default, these are the variables that are preconfigured, but you can change if you want.
  
  ![image](https://media.github.ibm.com/user/398248/files/8c172d80-2874-11ed-96c1-fcc67bf2e732)
  
  2.2. For <b>ibmcloud_region</b> we will leave it as default: us-south.
  
  2.3. For <b>ibmcloud_api_key</b> you have to insert your IBM Cloud API Key. You can create an API Key in Manage section, and then Access (IAM). For more information about how create your API Key you can access the link below.
  
  https://www.ibm.com/docs/en/app-connect/containers_eus?topic=servers-creating-cloud-api-key
  
  2.4. For <b>resource_group</b> you can leave it as default or insert the resource group that apply to your user.
  
  2.5. For <b>ssh_key</b> you must have an existing SSH Key for VPC and insert the name. For more information about how create a SSH Key for VPC you can access the link below.
  
  https://cloud.ibm.com/docs/vpc?topic=vpc-ssh-keys
  
  It's important that your SSH Key is in the same location that your workspace, otherwise the generate plan step will fail.
  
  2.6. And then, for <b>vpc_name</b> you can change the name of VPC that will be created.
  
  After set these variables we got this result
  
  ![image vars](https://media.github.ibm.com/user/398248/files/4741c580-2879-11ed-8c33-d2873b0ebed2)
  
### 3. Generate and apply plan
  
  Now, you can generate a plan and then, apply the plan.
  
  ![gen plan succ](https://media.github.ibm.com/user/398248/files/be8b5e00-293a-11ed-8036-c592c4a1cb38)
  ![apply sucess](https://media.github.ibm.com/user/398248/files/c21ee500-293a-11ed-8ac1-bccc0ce6eb26)
  
  After the apply plan step is completed, you can navigate to VPC's menu to see your VPC created, as you can see in the following image
  
  ![vpc created](https://media.github.ibm.com/user/398248/files/bc2a0380-293c-11ed-9358-42580f984c72)

  And see your VSI created too
  
  ![vsi vpc tf](https://media.github.ibm.com/user/398248/files/7457ac00-293d-11ed-8c3e-8710cc7a0914)

## Run this project locally

To run this project locally, complete the following steps:

- Clone this project.
- You can override default values that are in your ***variables.tf*** file.

## Variables 

|    Variable Name    |                           Description                             |
| ------------------- | ------------------------------------------------------------------|
|  ibmcloud_region    | IBM Cloud region where your infrastructrure will be provisioned in|
|  ibmcloud_api_key   | Your IBM Cloud API key                                            |
|  resource_group     | Desired resource group for the provisioned resources              |
|  ssh_key            | Insert the name of an existing SSH key for VPC                    |
|  vpc_name           | Desired name for your VPC                                         |
