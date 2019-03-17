variable "USER_NAME" {}
variable "TENANT_NAME" {}
variable "PASSWORD" {}
variable "AUTH_URL" {}
variable "REGION" {}
variable "DOMAIN_NAME" {}

variable "MYFLAVOR" {
  default = "1"
}

variable "MYIMAGE" {
/*
  default = "fdcecf4e-443a-46e0-84af-af606bb5b08a"
*/
  default = "d2840788-c1ed-43cc-9dff-f86047b80e5e"
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
