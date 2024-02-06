terraform {
  backend "s3" {
      encrypt = false
      bucket = "apispocc-team1-bucket-demo"
      dynamodb_table = "Apispocc-team1-db-table"
      key = "path/path/terraform-tfstate-subnet"
      region = "us-east-1"
  }
}
data "aws_availability_zones" "available" {}

resource "aws_subnet" "Apispocc-public-subnet-tf" {
  count             =  2
  vpc_id            = var.vpc_id
  cidr_block        = "${var.subnet_cidr_block_public[count.index]}"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  tags = {
    Name = "${var.subnet_name}-public-subnet.${count.index + 1}"
  }
}

resource "aws_subnet" "Apispocc-private-subnet-tf" {
  count             =  2
  vpc_id            = var.vpc_id
  cidr_block        = "${var.subnet_cidr_block_private[count.index]}"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  tags = {
    Name = "${var.subnet_name}-private-subnet.${count.index + 1}"
  }
}