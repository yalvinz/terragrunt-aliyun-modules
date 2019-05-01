data "terraform_remote_state" "slb" {
  backend = "s3"
  config {
    bucket    = "${var.s3_bucket}"
    key       = "${var.s3_key_prefix}/${var.region}/${var.environment}/${var.slb_remote_state_key}"
    endpoint  = "${var.s3_endpoint}"
    region    = "${var.s3_region}"
  }
}

resource "alicloud_slb_listener" "slbl" {
  count = "${var.use_redirect ? 0 : length(data.terraform_remote_state.slb.*.slb_ids)}"

  load_balancer_id          = "${data.terraform_remote_state.slb.slb_ids[count.index]}"
  acl_status                = "${var.slbl_acl_status}"
  backend_port              = "${var.slbl_backend_port}"
  bandwidth                 = "${var.slbl_bandwidth}"
  enable_http2              = "${var.slbl_enable_http2}"
  frontend_port             = "${var.slbl_frontend_port}"
  gzip                      = "${var.slbl_gzip}"
  health_check              = "${var.slbl_health_check}"
  health_check_connect_port = "${var.slbl_health_check_connect_port}"
  health_check_domain       = "${var.slbl_health_check_domain}"
  health_check_http_code    = "${var.slbl_health_check_http_code}"
  health_check_interval     = "${var.slbl_health_check_interval}"
  health_check_timeout      = "${var.slbl_health_check_timeout}"
  health_check_uri          = "${var.slbl_health_check_uri}"
  healthy_threshold         = "${var.slbl_health_threshold}"
  unhealthy_threshold       = "${var.slbl_unhealthy_threshold}"
  idle_timeout              = "${var.slbl_idle_timeout}"
  protocol                  = "${var.slbl_protocol}"
  request_timeout           = "${var.slbl_request_timeout}"
  scheduler                 = "${var.slbl_scheduler}"
  ssl_certificate_id        = "${var.slbl_ssl_certificate_id}"
  sticky_session            = "${var.slbl_sticky_session}"
  tls_cipher_policy         = "${var.slbl_tls_cipher_policy}"
  x_forwarded_for           = "${var.slbl_x_forwarded_for}"
  listener_forward          = "${var.slbl_listener_forward}"
  forward_port              = "${var.slbl_forward_port}"
}

resource "alicloud_slb_listener" "slbl_redirect" {
  count = "${var.use_redirect ? length(data.terraform_remote_state.slb.*.slb_ids) : 0}"

  load_balancer_id          = "${data.terraform_remote_state.slb.slb_ids[count.index]}"
  frontend_port             = "${var.slbl_frontend_port}"
  protocol                  = "${var.slbl_protocol}"
  listener_forward          = "${var.slbl_listener_forward}"
  forward_port              = "${var.slbl_forward_port}"
}
