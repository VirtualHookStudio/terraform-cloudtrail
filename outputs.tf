output "subnet_id" {
  description = "ID Subnet AWS"
  value       = aws_subnet.subnet-main.id
}

output "aws_security_group_id" {
  description = "ID Security group AWS"
  value       = aws_security_group.security-group.id
}

output "password_bucket_user" {
  value     = aws_iam_user_login_profile.login-bucket.password
  sensitive = true
}

output "password_ec2_user" {
  value     = aws_iam_user_login_profile.login-ec2.password
  sensitive = true
}
