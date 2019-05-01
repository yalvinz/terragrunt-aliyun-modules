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
variable "slbsg_remote_state_key" {}

# SLB rule
variable "slbr_frontend_port" {}

variable "slbr_domain" {}

variable "slbr_url" {}