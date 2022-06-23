# Environmental variables

variable "environment" {
  description = "Environment for the deployment. Ex: prod, dev, test, sandbox"
  type        = string
}

variable "location" {
  description = "Location for the deployment"
  type        = string
}

# Tag variables
variable "required_tags" {
  description = "List of required tags to be applied to the resource group. Tags will be inherited by child resources automatically based on Azure policy."
  type        = map(any)
}

# Virtual Machine variables
variable "bootdiagsname" {
  description = "Name of the storage account to store boot diagnostics"
  type        = string
}

variable "vmuser" {
  description = "Username for virtual machines"
  type        = string
}

variable "vmpass" {
  description = "Password for virtual machines"
  type        = string
}

variable "virtual_machines" {
  description = "Values for the virtual machines to be created"
  type        = map(any)
}
