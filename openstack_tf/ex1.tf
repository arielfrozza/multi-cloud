/*
Objective:
Create a instance in openstack, with existing image, flavor, keypair, security-group and network resources.

Use terraform provider and resource block.
*/

# Provider details

provider "openstack" {
  user_name   = "admin"
  tenant_name = "logistics"
  password    = "admin"
  auth_url    = "http://192.168.56.56:5000/v3"
  region      = "RegionOne"
  domain_name = "default"
}

# Instance creation

resource "openstack_compute_instance_v2" "vm01" {
  name            = "vm01"
  image_id        = "fdcecf4e-443a-46e0-84af-af606bb5b08a"
  flavor_id       = "1"
  key_pair        = "keypair_1"
  security_groups = ["default"]
  network {
    uuid = "278a6eb3-a05a-49f4-826f-b978f3833c29"
  }
}

output "vm-name" {
  value = "${openstack_compute_instance_v2.vm01.name}"
}

output "vm-id" {
  value = "${openstack_compute_instance_v2.vm01.id}"
}

output "vm-ip" {
	value = "${openstack_compute_instance_v2.vm01.network.0.fixed_ip_v4}"
}
