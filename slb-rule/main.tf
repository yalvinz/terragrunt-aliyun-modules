data "terraform_remote_state" "slb" {
  backend = "s3"
  config {
    bucket    = "${var.s3_bucket}"
    key       = "${var.s3_key_prefix}/${var.region}/${var.environment}/${var.slb_remote_state_key}"
    endpoint  = "${var.s3_endpoint}"
    region    = "${var.s3_region}"
  }
}

data "terraform_remote_state" "slbsg" {
  backend = "s3"
  config {
    bucket    = "${var.s3_bucket}"
    key       = "${var.s3_key_prefix}/${var.region}/${var.environment}/${var.slbsg_remote_state_key}"
    endpoint  = "${var.s3_endpoint}"
    region    = "${var.s3_region}"
  }
}

resource "alicloud_slb_rule" "slbr" {
  count = "${length(data.terraform_remote_state.slb.slb_ids)}"

  load_balancer_id = "${data.terraform_remote_state.slb.slb_ids[count.index]}"
  frontend_port    = "${var.slbr_frontend_port}"
  domain           = "${var.slbr_domain}"
  url              = "${var.slbr_url}"
  server_group_id  = "${data.terraform_remote_state.slbsg.slbsg_ids[count.index]}"
}
