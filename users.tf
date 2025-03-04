#USER READ BUCKET
resource "aws_iam_user" "bucket-user" {
  name = var.bucket_user_name
}

#LOGIN USER BUCKET
resource "aws_iam_user_login_profile" "login-bucket" {
  user = aws_iam_user.bucket-user.name
}

#POLICY BUCKET
resource "aws_iam_policy" "bucket-policy" {
  name        = var.bucket_policy_name
  description = "Allow to read bucket warehouse"

  policy = file("policies/bucket.json")
}

#ATTACH POLICY TO USER BUCKET
resource "aws_iam_user_policy_attachment" "bucker-user-attach" {
  user       = aws_iam_user.bucket-user.name
  policy_arn = aws_iam_policy.bucket-policy.arn
}

#USER EC2
resource "aws_iam_user" "ec2-user" {
  name = var.ec2_user_name
}

#LOGIN USER EC2
resource "aws_iam_user_login_profile" "login-ec2" {
  user = aws_iam_user.ec2-user.name
}


#POLICY EC2
resource "aws_iam_policy" "ec2-policy" {
  name        = var.ec2_policy_name
  description = "Allow to view ec2"

  policy = file("policies/ec2.json")
}

#ATTACH POLICY TO USER EC2
resource "aws_iam_user_policy_attachment" "ec2-user-attach" {
  user       = aws_iam_user.ec2-user.name
  policy_arn = aws_iam_policy.ec2-policy.arn
}