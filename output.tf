output "awsinstance_info" {
    value = aws_instance.expense
}

output "securitygroup_id" {
    value = aws_security_group.allow_ssh.id
  
}