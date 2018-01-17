provider "google" {
  region = "${var.region}"
}

module "demo-vpc" {
  source                  = "tasdikrahman/network/google"
  name                    = "${var.network_name}"
  auto_create_subnetworks = false
}

module "subnet-demo-vpc" {
  source            = "tasdikrahman/network-subnet/google"
  name              = "${module.demo-vpc.name}-${var.region}"
  vpc               = "${module.demo-vpc.self_link}"
  subnetwork-region = "${var.region}"
  ip_cidr_range     = "${var.ip_cidr_range}"
}
