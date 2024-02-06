#output "private-subnet-tf" {
#description = "ID of the vpc"
#value       = aws_subnet.Apispocc-private-subnet-tf.id
#}

#output "public-subnet-tf" {
#description = "ID of the vpc"
#value       = aws_subnet.Apispocc-public-subnet-tf.id
#}

output "public-subnets-tf" {
  value = "${aws_subnet.Apispocc-public-subnet-tf.*.id}"
}

output "public-subnet-tf-1" {
  value = "${element(aws_subnet.Apispocc-public-subnet-tf.*.id, 1 )}"
}

output "public-subnet-tf-2" {
  value = "${element(aws_subnet.Apispocc-public-subnet-tf.*.id, 2 )}"
}

output "private-subnet-tf-1" {
  value = "${element(aws_subnet.Apispocc-private-subnet-tf.*.id, 1 )}"
}

output "private-subnet-tf-2" {
  value = "${element(aws_subnet.Apispocc-private-subnet-tf.*.id, 2 )}"
}