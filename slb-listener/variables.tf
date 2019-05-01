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

# SLB listener
variable "use_redirect" {
  default = false
}

variable "slbl_acl_status" {
  default = "off"
}

variable "slbl_backend_port" {
  default = 1
}

variable "slbl_bandwidth" {
  default = "-1"
}

variable "slbl_enable_http2" {
  default = "off"
}

variable "slbl_frontend_port" {}

variable "slbl_gzip" {
  default = "false"
}

variable "slbl_health_check" {
  default = "off"
}

variable "slbl_health_check_connect_port" {
  default = "-520"
}

variable "slbl_health_check_domain" {
  default = ""
}

variable "slbl_health_check_http_code" {
  default = "http_2xx"
}

variable "slbl_health_check_interval" {
  default = "2"
}

variable "slbl_health_check_timeout" {
  default = "5"
}

variable "slbl_health_check_uri" {
  default = ""
}

variable "slbl_health_threshold" {
  default = "3"
}

variable "slbl_unhealthy_threshold" {
  default = "3"
}

variable "slbl_idle_timeout" {
  default = "15"
}

variable "slbl_protocol" {}

variable "slbl_request_timeout" {
  default = "60"
}

variable "slbl_scheduler" {
  default = "wrr"
}

variable "slbl_ssl_certificate_id" {
  default = ""
}

variable "slbl_sticky_session" {
  default = "off"
}

variable "slbl_tls_cipher_policy" {
  default = "tls_cipher_policy_1_0"
}

variable "slbl_x_forwarded_for" {
  type = "list"
  default = []
}

variable "slbl_listener_forward" {
  default = "off"
}

variable "slbl_forward_port" {
  default = "1"
}
