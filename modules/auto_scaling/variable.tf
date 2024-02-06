variable "vpc_id" {
#description = "Enter vpc id to access subnet"
type = string
default = "vpc-0ed5e9747ef5f085d"
}

variable "ami_id" {
description = "creates ami to know which instance you want to create"
type        = string
default     = "ami-053b0d53c279acc90"
}

variable "target_group_arn" {
type = string
default = "arn:aws:elasticloadbalancing:us-east-1:904089174636:targetgroup/my-test-tg-jira/a596d8bba6f092f3"
}
variable "public-subnet-tf-1" {
type = string
default = "subnet-0a929758f1bc40db7"
}
variable "public-subnet-tf-2" {
type = string
default = "subnet-04079a13731fd4cde"
}