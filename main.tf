provider "google" {
  region = "${var.region}"
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
    ports    = ["8080"]
  }

  source_tags = ["web"]
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "test-firewall-ssh"
  network = "${module.demo-vpc.name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_tags = ["web"]
}
