variable "location" {
  type = string
}

# Tag variables
variable "required_tags" {
  description = "List of required tags to be applied to the resource group. Tags will be inherited by child resources automatically based on Azure policy."
  type        = map(any)
}

variable "environment" {
  type = string
}

variable "bootdiagsep" {
  description = "Primary blob endpoint of the storage account to store boot diagnostics"
  type        = string
}

variable "workloadname" {
  type = string
}

variable "size" {
  type = string
}

variable "subnetid" {
  type = string
}

variable "vmuser" {
  type = string
}

variable "vmpass" {
  type = string
}

variable "sku" {
  type = string
}
