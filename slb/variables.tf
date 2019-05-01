terraform {backend "s3" {}}
variable "region" {}
variable "s3_bucket" {}
variable "s3_key_prefix" {}
variable "s3_endpoint" {}
variable "s3_region" {}
variable "environment" {}

# Module variables

# Vswitch
variable "vsw_remote_state_key" {}

# SLB
variable "slb_amount" {}

variable "slb_name" {}

variable "slb_specification" {}

variable "slb_bandwidth" {
  default = "1000"
}

variable "slb_internet" {}

variable "slb_internet_charge_type" {}

variable "slb_expected_zones" {
  type = "list"
}

# Instance
variable "use_default_backend_servers" {
  default = false
}

variable "instance_ids" {
  type = "list"
  default = []
}