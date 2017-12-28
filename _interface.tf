variable "region" {
  description = "The region in which to deploy."
  default = "us-east1"
}

variable "network_name" {
  description = "The name of the network to be created."
}

output "network_self_link" {
  value = "${module.this.self_link}"
}

output "name" {
  value = "${module.this.name}"
}
