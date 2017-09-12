
variable "region" {
	default = "eu-west-1"

}

variable "OS" {
	description = "Enter OS [Windows | CentOS ]"
}

variable "use_ami" {
	"default" = {
		"windows" = "ami-6dd02214"
		"centos" = "ami-061b1560"
	}
}

variable "com_port" {
	default = {
		"windows" = 3389
		"centos" = 22
	}
}
