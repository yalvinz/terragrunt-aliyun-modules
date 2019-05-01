data "terraform_remote_state" "slb" {
  backend = "s3"
  config {
    bucket    = "${var.s3_bucket}"
    key       = "${var.s3_key_prefix}/${var.region}/${var.environment}/${var.slb_remote_state_key}"
    endpoint  = "${var.s3_endpoint}"
    region    = "${var.s3_region}"
  }
}

resource "alicloud_slb_server_group" "slbsg" {
  count = "${length(data.terraform_remote_state.slb.slb_ids)}"

  load_balancer_id = "${data.terraform_remote_state.slb.slb_ids[count.index]}"
  name             = "tf-${var.slbsg_name}"
  servers          = "${var.slbsg_servers}"
  # servers          = [
  #   {
  #     server_ids = "${var.vsg_server_ids}"
  #     port       = "${var.vsg_port}"
  #     weight     = "${var.vsg_weight}"
  #   }
  # ]

  lifecycle {
    ignore_changes = [
      "servers"
    ]
  }
}
