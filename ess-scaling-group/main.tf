resource "alicloud_ess_scaling_group" "esssg" {
  scaling_group_name = "tf-${var.esssg_name}"
  min_size           = "${var.esssg_min_size}"
  max_size           = "${var.esssg_max_size}"
  loadbalancer_ids   = "${var.esssg_loadbalancer_ids}"
  default_cooldown   = "${var.esssg_default_cooldown}"
  removal_policies   = "${var.esssg_removal_policies}"
  vswitch_ids        = "${var.esssg_vswitch_ids}"
  multi_az_policy    = "${var.esssg_multi_az_policy}"

  lifecycle {
    ignore_changes = [
      "vswitch_ids",
    ]
  }
}