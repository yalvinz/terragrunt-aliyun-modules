data "terraform_remote_state" "vsw" {
  backend = "s3"
  config {
    bucket    = "${var.s3_bucket}"
    key       = "${var.s3_key_prefix}/${var.region}/${var.environment}/${var.vsw_remote_state_key}"
    endpoint  = "${var.s3_endpoint}"
    region    = "${var.s3_region}"
  }
}

resource "alicloud_slb" "slb" {
  count = "${var.slb_amount}"

  name                 = "tf-${var.slb_name}"
  specification        = "${var.slb_specification}"
  bandwidth            = "${var.slb_bandwidth}"
  internet             = "${var.slb_internet}"
  internet_charge_type = "${var.slb_internet_charge_type}"
  vswitch_id           = "${lookup(data.terraform_remote_state.vsw.vswitches, format("%s%s", "${var.region}", "${lookup(var.slb_expected_zones[count.index % length(var.slb_expected_zones)], "master")}"))}"
  master_zone_id       = "${var.region}${lookup("${var.slb_expected_zones[count.index % length(var.slb_expected_zones)]}", "master")}"
  slave_zone_id        = "${var.region}${lookup("${var.slb_expected_zones[count.index % length(var.slb_expected_zones)]}", "slave")}"
  
  tags = {
    Environment = "${var.environment}"
  }

  lifecycle {
    ignore_changes = [
      "vswitch_id",
      "master_zone_id",
      "slave_zone_id"
    ]
  }
}

# data "alicloud_instances" "instance" {
#   tags = { Environment = "production", consul_tags = "www", Hostgroup = "tkp-nginx" }
# }

resource "alicloud_slb_attachment" "slba" {
  count = "${var.use_default_backend_servers ? var.slb_amount : 0}"

  load_balancer_id = "${alicloud_slb.slb.*.id[count.index]}"
  instance_ids     = "${var.instance_ids}"
  # instance_ids     = "${data.alicloud_instances.instance.instances.*.id}"

  lifecycle {
    ignore_changes = [
      "instance_ids"
    ]
  }

  depends_on = ["alicloud_slb.slb"]
}