# GCP Network Workspace

This module creates a network in GCP using a module: [network](https://registry.terraform.io/modules/tasdikrahman/network/google)

It is part of an example to be used in Terraform Enterprise.

## Usage

Set your environment varialbes and run terraform.

$ GOOGLE_CLOUD_KEYFILE_JSON="$(cat ~/.gcloud/my_keyfile.json)" \
GOOGLE_PROJECT="my_project" \
GOOGLE_REGION="us-east1" terraform plan/apply
