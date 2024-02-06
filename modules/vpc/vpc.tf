terraform {
  backend "s3" {
      encrypt = false
      bucket = "apispocc-team1-bucket-demo"
      dynamodb_table = "Apispocc-team1-db-table"
      key = "path/path/terraform-tfstate-vpc"
      region = "us-east-1"
  }
}

resource "aws_vpc" "Apispocc-vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "${var.name}-vpc"
  }
}
# internet gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.Apispocc-vpc.id}"

  tags = {
    Name = "my-test-igw"
  }
}

# Public Route Table

resource "aws_route_table" "public_route" {
  vpc_id = "${aws_vpc.Apispocc-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "my-test-public-route"
  }
}

# Private Route Table

/* resource "aws_default_route_table" "private_route" {
  default_route_table_id = "${aws_vpc.Apispocc-vpc.default_route_table_id}"

  route {
    nat_gateway_id = "${aws_nat_gateway.my-test-nat-gateway.id}"
    cidr_block     = "0.0.0.0/0"
  }

  tags = {
    Name = "my-private-route-table"
  } 
} */
