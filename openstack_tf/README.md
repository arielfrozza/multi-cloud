Terraform:
=====================

In this series of exercises, we are going to learn, How to write our openstack infrastructure in terraform configurations.

Please download this repository to your machine.

Objective:  Demonstrate the openstack resource(vm) creation in terraform. we covers **provider,resource and output block**  of terraform configuration in this exercise.

Launch the openstack server instance with existing available resources (keypair, network, flavor, image, security group).

Terraform : Openstack Infra:
===============================

we will explain the complex infra deployment in openstack using Terraform.

We use ubuntu 16.04 image and flavor 2 for this deployment.


![Infrastructure Diagram](todo.jpg?raw=true)


Terraform files:
----------------------

**vars.tf**

**stack.tf**


**cloudinit.yaml**

**keys**


Deployment Steps:
------------
1. Create a new directory and create the ex01.tf file 

```
mkdir ex1
cd ex1
vi ex1.tf
```

2. create the provider blocks in the file

https://www.terraform.io/docs/providers/openstack/index.html

```
provider "openstack" {
  user_name   = "demo"
  tenant_name = "demo"
  password    = "openstack123"
  auth_url    = "http://10.0.1.6/identity"
  region      = "RegionOne"
  domain_name = "default"
}
```

3. create the resource block in the file
resource : instance (vm)

```
resource "openstack_compute_instance_v2" "vm1" {
  name            = "vm1"
  image_id        = "dea87f06-9fdc-410c-974f-470b057cfa2b"
  flavor_id       = "1"
  key_pair        = "mykey"
  security_groups = ["default"]
  network {
    uuid = "db4a268a-465d-40d7-9db2-54b82d945bec"
  }
}
```


4. Create the output variable to display the VM attributes.

```
output "vm-name" {
  value = "${openstack_compute_instance_v2.vm1.name}"
}

output "vm-id" {
  value = "${openstack_compute_instance_v2.vm1.id}"
}

output "vm-ip" {
	value = "${openstack_compute_instance_v2.vm1.network.0.fixed_ip_v4}"
}

```


5. Execute terraform init & plan

```
terraform init
terraform plan
```


6. Apply your infra

```
terraform apply
```

7. verify your infra

Check with openstack commands, or horizon dashboard


8. Check the terraform resource properties

```
terraform show
```


9. destroy your infra

```
terraform destroy
```


10. Use environment(rc file) variable instead of provider block and repeat this exercise.


```
export OS_USERNAME=demo
export OS_PASSWORD=openstack123
export OS_REGION_NAME=RegionOne
export OS_TENANT_NAME=demo
export OS_USER_DOMAIN_ID=default
export OS_AUTH_URL=http://10.0.1.6/identity
```


Testing:
-----------

1. SSH to the instances
2. web requests to the server


Referneces:
===============
1. https://www.terraform.io/docs/providers/openstack/index.html
2. https://www.terraform.io/docs/providers/openstack/r/compute_instance_v2.html
