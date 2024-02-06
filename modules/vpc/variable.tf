variable "vpc_cidr_block" {
type = string 
default = "10.0.0.0/16"
}
variable "name"{
description = "write name for your vpc"
type = string
default = "Apispocc-vpc"
}