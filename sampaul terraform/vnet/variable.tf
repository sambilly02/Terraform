variable "vnet_name"{
  default = "modulevnet"
}

variable "rg_name" {
  default = "terraform_module"
}

variable "rg_location" {
  default = "eastus2"
}

variable "subnet_name" {
  default = "billysubnet"

}

variable "nic_name" {
  default = "billy-nic"

}

variable "pip_name" {
  default = "billypip"
}

variable "nsg_name"{
default = "billynsg"

}