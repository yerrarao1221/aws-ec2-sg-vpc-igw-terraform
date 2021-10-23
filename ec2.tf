resource "aws_instance" "web-server" {
  ami             = var.ami_type
  instance_type   = var.instanceType
  subnet_id = "${aws_subnet.demo-subnet-pub-1.id}"
  security_groups = ["${aws_security_group.my-sg.id}"]
  key_name = "${var.key_pair_value}"
  tags = {
    Name = "${var.ec2_instanceName}"
  }
}
