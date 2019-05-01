terraform {backend "s3" {}}
variable "region" {}
variable "s3_bucket" {}
variable "s3_key_prefix" {}
variable "s3_endpoint" {}
variable "s3_region" {}
variable "environment" {}

# Module variables

# VPC
variable "vpc_id" {}

# Vswitch
variable "vsw_vswitches" {
  type = "list"
}

variable "vsw_name" {}