provider "google" {
  region = "${var.region}"
}

# make the project
resource "google_project" "rsg-tfe-poc-1" {
  name            = "rsg-tfe-poc-1"
  project_id      = "rsg-tfe-poc-1"
  folder_id       = "537099506332"
  billing_account = "${var.billing_account}"
}

# Create VPC
module "demo-vpc" {
  source                  = "tasdikrahman/network/google"
  name                    = "${var.network_name}"
  auto_create_subnetworks = false
}

# Create Subnets
module "subnet-demo-vpc" {
  source            = "tasdikrahman/network-subnet/google"
  name              = "${module.demo-vpc.name}-${var.region}"
  vpc               = "${module.demo-vpc.self_link}"
  subnetwork-region = "${var.region}"
  ip_cidr_range     = "${var.ip_cidr_range}"
}

# Create firewall rules
resource "google_compute_firewall" "allow-http" {
  name    = "test-firewall-http"
  network = "${module.demo-vpc.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
}
