/* variable "region" {
	default = "eu-west-1"
}*/

provider "aws" {
  region     = "${var.region}"
}
output "Public IP"
{
  value = "${aws_instance.instance.public_ip}"
}

