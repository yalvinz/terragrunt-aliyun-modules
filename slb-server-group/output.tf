output "slbsg_ids" {
  value = "${alicloud_slb_server_group.slbsg.*.id}"
}