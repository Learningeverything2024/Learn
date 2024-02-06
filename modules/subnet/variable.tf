variable "vpc_id" {
description = "Enter vpc id to access subnet"
type = string
default = "vpc-0ed5e9747ef5f085d"
}

variable "subnet_cidr_block_public"{
description = "enter subnet cidr block value" 
type = list
default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "subnet_cidr_block_private"{
description = "enter subnet cidr block value" 
type = list
default = ["10.0.3.0/24","10.0.4.0/24"]
}

variable "subnet_name"{
description = "write name for your subnet"
type = string
default = "Apispocc-jira"
}