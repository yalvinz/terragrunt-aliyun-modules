provider "alicloud" {
  version = "1.40"
  region  = "${var.region}"
}

provider "random" {
  version = "= 2.1.1"
}
