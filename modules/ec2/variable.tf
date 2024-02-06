variable "ami_id" {
#description = "creates ami to know which instance you want to create"
type        = string
default     = "ami-053b0d53c279acc90"
}
variable "vpc_id" {
description = "Enter vpc id to access subnet"
type = string
default = "vpc-0ed5e9747ef5f085d"
}

variable "instance_type"{
description = " instance type"
type = string 
default = "t2.micro"
}

variable "public-subnets-tf" {
type = list
default = ["subnet-0a929758f1bc40db7","subnet-04079a13731fd4cde"]
}

/*
variable "private-subnet-tf-1" {
description = ""
type = list 
default = []
}
#variable "private-subnet-tf-2" {
}
variable "public-subnet-tf-1" {
#description = "Public subnet"
#type = list
#default = ["subnet-098f7810612c6c803","subnet-0fcb8983f5afb8ea8"]
}
variable "public-subnet-tf-2" {
} 
*/
variable "ec2_name" {
description = "give name for instance"
type = string 
default = "Apispocc-jira"
}