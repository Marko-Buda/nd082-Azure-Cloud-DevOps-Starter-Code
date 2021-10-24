variable "prefix" {
  description = "The prefix for all resources in this terraform template."
  default = "project-one"
}

variable "location" {
  description = "The Azure Region in which all resources will be created."
  default     = "westus"
}

variable "packer_image_name" {
  description = "Name of the Packer image"
  default     = "UbuntuPackerImage"
}

variable "input_number_of_vm" {
  description = "The number VM that need to be deployed on Azure Cloud"  
  type        = number
  default     = 2
}

variable "tags" {
  description = "Tags need to be defined so that resources can be created on Azure"
  type        = map(string)
  default = {
    project_name = "deploying_a_web_server_in_azure"
  }
}

variable "username" {
  description = "The username profile is neccesarry to log on to log into Azure Virtual Machine."
  default = "azure_user"
}

variable "password" {
  description = "The password needed to successfully log into user account on a deployed Azure Virtual Machine."
  default = "Keyword.123"
}