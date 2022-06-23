# Configure Terraform
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.10.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "<rg for terraform state backend storage>"
  #   storage_account_name = "<storage account for terraform state backend storage>"
  #   container_name       = "vmtfstate"
  #   key                  = "<storage account key>"
  # }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create Resource Group
resource "azurerm_resource_group" "bootdiags" {
  name     = "rg-${var.environment}-${var.location}-bootdiags"
  location = var.location
  tags     = var.required_tags
}

# Create the boot diagnostics storage account
module "bootdiags" {
  source        = "./modules/storageacct"
  bootdiagsname = var.bootdiagsname
  location      = azurerm_resource_group.bootdiags.location
  rgname        = azurerm_resource_group.bootdiags.name
}

# Deploy one or more Virtual Machines
module "vm" {
  source        = "./modules/vm"
  for_each      = var.virtual_machines
  location      = var.location
  environment   = var.environment
  bootdiagsep   = module.bootdiags.primary_blob_endpoint
  vmpass        = var.vmpass
  vmuser        = var.vmuser
  required_tags = var.required_tags
  workloadname  = each.value["workloadname"]
  size          = each.value["size"]
  subnetid      = each.value["subnetid"]
  sku           = each.value["sku"]

}
