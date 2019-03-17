# Provider details

provider "openstack" {
  user_name   = "${var.USER_NAME}"
  tenant_name = "${var.TENANT_NAME}"
  password    = "${var.PASSWORD}"
  auth_url    = "${var.AUTH_URL}"
  region      = "${var.REGION}"
  domain_name = "${var.DOMAIN_NAME}"
}
