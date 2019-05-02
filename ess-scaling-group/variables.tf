terraform {backend "s3" {}}
variable "region" {}
variable "s3_bucket" {}
variable "s3_key_prefix" {}
variable "s3_endpoint" {}
variable "s3_region" {}
variable "environment" {}

# Module variables

# ESS scaling group
variable "esssg_name" {}

variable "esssg_min_size" {}

variable "esssg_max_size" {}

variable "esssg_loadbalancer_ids" {
  type = "list"
  default = []
}

variable "esssg_default_cooldown" {
  default = 300
}

variable "esssg_removal_policies" {
  type = "list"
  default = ["NewestInstance", "OldestInstance"]
}

variable "esssg_vswitch_ids" {
  type = "list"
  default = []
}

variable "esssg_multi_az_policy" {
  default = "BALANCE"
}