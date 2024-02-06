output "asg" {
  description = "ID of the auto scalling group"
  value       = aws_security_group.my-asg-sg.id
}