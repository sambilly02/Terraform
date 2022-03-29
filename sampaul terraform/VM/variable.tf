variable "rg_name" {
  default = "terraform_module"
}

variable "rg_location" {
  default = "eastus2"
}

variable "vm_username" {
  description = "VM administrator name"
  type        = string
  sensitive   = true
  default = "sysforeuser"
}
variable "vm_password" {
  description = "VM administrator password"
  type        = string
  sensitive   = true
  default = "password@123"
}

variable "nic2" {
  type = string
}