resource "aws_key_pair" "mykey" {
  key_name = "mykey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
resource "aws_instance" "vm01" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}"

  provisioner "file" {
    source = "simple_app.py"
    destination = "/opt/simple_app.py"
  }
  connection {
    user = " ${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get -y install python python-pip python-setuptools python-dev build-essential",
      "sudo pip install flask",
      "FLASK_APP=/opt/simple_app.py nohup flask run --host=0.0.0.0 &"
    ]
  }
}
