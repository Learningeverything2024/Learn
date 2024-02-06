terraform {
  backend "s3" {
      encrypt = false
      bucket = "apispocc-team1-bucket-demo"
      dynamodb_table = "Apispocc-team1-db-table"
      key = "path/path/terraform-tfstate-s3"
      region = "us-east-1"
  }
}
resource "aws_s3_bucket" "apispocc-team1-bucket-demo1" {
    bucket = var.bucket_name
    acl = var.acl_value
}