
resource "aws_instance" "instance" {
	ami           = "${lookup(var.use_ami, var.OS)}"
	instance_type = "t2.micro"
	key_name = "terraform"
	security_groups = ["${aws_security_group.sg.id}"]
	subnet_id = "${aws_subnet.10Range.id}"
	associate_public_ip_address = true
	root_block_device {
		volume_type = "gp2"
		volume_size = "40"
		delete_on_termination = true
	}
	
  tags {
    Name = "Terraform",
    ENV = "Test"
  }
}
