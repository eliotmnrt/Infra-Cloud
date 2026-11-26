resource "openstack_networking_router_v2" "router1" {
  name                = "router1"
  admin_state_up      = "true"
  external_network_id = var.network_external_id
}

module "network_dev" {
  source              = "./modules/network"
  network_name        = var.network_internal_dev
  network_subnet_cidr = var.network_subnet_cidr
  router_id           = openstack_networking_router_v2.router1.id
}