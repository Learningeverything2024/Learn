#output "instance_id" {
#  value = aws_instance.Apispocc-ec2.id
#}

output "instance_id_1" {
  value = "${element(aws_instance.Apispocc-ec2.*.id, 1)}"
}
output "instance_id_2" {
  value = "${element(aws_instance.Apispocc-ec2.*.id, 2)}"
}