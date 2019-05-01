output "vswitch_ids" {
 value = "${alicloud_vswitch.vsw.*.id}"
}

output "vswitches" {
  value = "${zipmap(
    alicloud_vswitch.vsw.*.availability_zone, alicloud_vswitch.vsw.*.id
  )}"
}