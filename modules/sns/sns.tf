terraform {
  backend "s3" {
      encrypt = false
      bucket = "apispocc-team1-bucket-demo"
      dynamodb_table = "Apispocc-team1-db-table"
      key = "path/path/terraform-tfstate-sns"
      region = "us-east-1"
  }
}
resource "aws_sns_topic" "my-test-alarm" {
  name = "my-test-alarms-topic"

  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command = "aws sns subscribe --topic-arn ${self.arn} --protocol email --notification-endpoint ${var.alarms_email}"
  }
}