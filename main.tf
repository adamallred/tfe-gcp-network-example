provider "google" {
  region = "${var.region}"
}

module "this" {
  source = "tasdikrahman/network/google"
  name   = "${var.network_name}"
  auto_create_subnetworks = true
}
