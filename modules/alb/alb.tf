terraform {
  backend "s3" {
      encrypt = false
      bucket = "apispocc-team1-bucket-demo"
      dynamodb_table = "Apispocc-team1-db-table"
      key = "path/path/terraform-tfstate-alb"
      region = "us-east-1"
  }
}

resource "aws_lb_target_group" "my-target-group" {
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  name        = "my-test-tg-jira"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = "${var.vpc_id}"
}

/*resource "aws_lb_target_group_attachment" "my-alb-target-group-attachment1" {
  target_group_arn = "${aws_lb_target_group.my-target-group.arn}"
  target_id        = "${var.instance1_id}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "my-alb-target-group-attachment2" {
  target_group_arn = "${aws_lb_target_group.my-target-group.arn}"
  target_id        = "${var.instance2_id}"
  port             = 80
}*/

resource "aws_lb" "my-aws-alb" {
  name     = "my-test-alb"
  internal = false

    security_groups = [
  "${aws_security_group.my-alb-sg-jira.id}", 
  ]
  
  subnets = [
    "${var.public-subnet-tf-1}",
    "${var.public-subnet-tf-2}",
  ]

  tags = {
    Name = "my-test-alb"
  }

  ip_address_type    = "ipv4"
  load_balancer_type = "application"
}

resource "aws_lb_listener" "my-test-alb-listner" {
  load_balancer_arn = "${aws_lb.my-aws-alb.arn}"
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.my-target-group.arn}"
  }
}

 resource "aws_security_group" "my-alb-sg-jira" {
  name   = "my-alb-sg-jira"
  vpc_id = "${var.vpc_id}"
} 

resource "aws_security_group_rule" "inbound_ssh" {
  from_port         = 22
  protocol          = "tcp"
 security_group_id = "${aws_security_group.my-alb-sg-jira.id}"
 #security_group_id = var.my-sg
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "inbound_http" {
  from_port         = 80
  protocol          = "tcp"
 security_group_id = "${aws_security_group.my-alb-sg-jira.id}"
 #security_group_id = var.my-sg
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "outbound_all" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.my-alb-sg-jira.id}"
  #security_group_id = var.my-sg
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}