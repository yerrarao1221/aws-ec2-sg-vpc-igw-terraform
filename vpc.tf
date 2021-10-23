resource "aws_vpc" "demo_vpc" {
	cidr_block = "10.8.0.0/16"
	instance_tenancy = "default"
  	tags = {
	  Name = "${var.vpcName}"
	}
}
resource "aws_subnet" "demo-subnet-pub-1" {
	vpc_id = "${aws_vpc.demo_vpc.id}"
	cidr_block = "10.8.1.0/24"
	map_public_ip_on_launch = "true"
	availability_zone = var.alb_zone
	tags = {
  	  Name = "${var.pub-subnetName}"
	}
}

