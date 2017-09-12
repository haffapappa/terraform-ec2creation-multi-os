#Create a new VPC
resource "aws_vpc" "vpc" {
	cidr_block = "10.0.0.0/16"
	instance_tenancy = "default"
	enable_dns_hostnames = true 
	enable_dns_support = true

	tags {
	Name = "terraforBuild"
}
}

#Create a subnet
resource "aws_subnet" "10Range" {
	vpc_id = "${aws_vpc.vpc.id}"
	cidr_block = "10.0.10.0/24"
	
	tags {
	Name = "10Range"
}
}

#Create the IGW
resource "aws_internet_gateway" "gw" {
	vpc_id = "${aws_vpc.vpc.id}"
	
	tags {
	Name = "terrformBuild"
}
}

#Add the IGW route
resource "aws_route" "cr" {
	route_table_id = "${aws_vpc.vpc.main_route_table_id}"
	destination_cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.gw.id}"
}

#Create a SG
resource "aws_security_group" "sg" {
	name = "terraform-sg"
	description = "Created by terraform"
	vpc_id = "${aws_vpc.vpc.id}"
	
	ingress {
		from_port = "${lookup(var.com_port, var.OS)}"
		to_port = "${lookup(var.com_port, var.OS)}"
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags{
	Name = "terraformBuilds"
}
}
