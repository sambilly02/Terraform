module "resourcegroup" {
  source = "./resource_group"

}
module "vnet"{
  source = "./vnet"

}

module "vm" {
  source = "./vm"
  nic2 = module.vnet.nic_id
  depends_on = [
    module.vnet
  ]
}