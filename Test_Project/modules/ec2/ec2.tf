resource "aws_instance" "web" {
  #ami           = "ami-6871a115"
  #instance_type = "t2.micro"
  instance_type="${var.instance_type}"
  ami="${var.ami}"
  subnet_id = "${var.subnet_id}"
  vpc_security_group_ids=["${var.security_group}"]
  key_name="${var.key_name}"
  #key_name="Auto"
  #key_name="${file("${path.module}/Auto.pub")}"

  tags {
    Name = "${var.tag_ins}"
  }
}

