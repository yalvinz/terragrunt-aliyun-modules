resource "alicloud_vswitch" "vsw" {
  count = "${length(var.vsw_vswitches)}"

  vpc_id            = "${var.vpc_id}"
  name              = "${var.vsw_name}-${lookup(var.vsw_vswitches[count.index], "zone")}"
  cidr_block        = "${lookup(var.vsw_vswitches[count.index], "cidr_block")}"
  availability_zone = "${var.region}${lookup(var.vsw_vswitches[count.index], "zone")}"
}

#resource "alicloud_route_table_attachment" "rtba" {
#  count = "${length(var.vsw_vswitches)}"
#
#  vswitch_id     = "${alicloud_vswitch.vsw.*.id[count.index]}"
#  route_table_id = "${lookup(var.vsw_vswitches[count.index], "rtb_id")}"
#
#  depends_on = ["alicloud_vswitch.vsw"]
#}
