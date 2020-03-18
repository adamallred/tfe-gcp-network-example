variable "region" {
  description = "The region in which to deploy."
  default     = "us-east1"
}

variable "network_name" {
  description = "The name of the network to be created."
}

variable "ip_cidr_range" {
  description = "The IP range to create."
}

variable "billing_account" {
}

output "network_self_link" {
  value = "${module.demo-vpc.self_link}"
}

output "name" {
  value = "${module.demo-vpc.name}"
}

output "region" {
  value = "${var.region}"
}

output "subnetwork_self_link" {
  value = "${module.subnet-demo-vpc.self_link}"
}
