terraform {backend "s3" {}}
variable "region" {}
variable "s3_bucket" {}
variable "s3_key_prefix" {}
variable "s3_endpoint" {}
variable "s3_region" {}
variable "environment" {}

# Module variables

# SLB
variable "slb_remote_state_key" {}

# SLB server group
variable "slbsg_name" {}

variable "slbsg_servers" {
  type = "list"
  default = []
}

# variable "vsg_server_ids" {
#   default = []
# }

# variable "vsg_port" {}

# variable "vsg_weight" {}
