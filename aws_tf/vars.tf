#(para Ubuntu, pode-se usar https://cloud-images.ubuntu.com/locator/ec2)

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-0ac019f4fcb7cb7e6"
	us-west-2 = "ami-06b94666"
	eu-west-1 = "ami-0d729a60"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
