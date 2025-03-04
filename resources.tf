////////////////////////////////////
///////RESOURCES PROJECT AWS////////
////////////////////////////////////

#BUCKET S3 "WAREHOUSE"
resource "aws_s3_bucket" "warehouse" {
  bucket = var.bucket_warehouse_name
}

#EC2 "WORKSTATION"
resource "aws_instance" "workstation" {
  ami             = var.instance_ami
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.subnet-main.id
  security_groups = [aws_security_group.security-group.id]

  tags = {
    Name = "workstation"
  }
}


////////////////////////////////////
////LOGS CLOUDTRAIL & CLOUDWATCH////
////////////////////////////////////

#BUCKET S3 "CLOUDTRAIL-LOGS"
resource "aws_s3_bucket" "cloudtrail-logs" {
  bucket        = var.bucket_cloudtrail_logs_name
  force_destroy = true
}

#CLOUDTRAIL
resource "aws_cloudtrail" "cloudtrail-logs" {
  name                          = var.cloudtrail_name
  s3_bucket_name                = aws_s3_bucket.cloudtrail-logs.id
  include_global_service_events = true
  is_multi_region_trail         = false

  cloud_watch_logs_group_arn = "${aws_cloudwatch_log_group.cloudtrail-log-group.arn}:*"
  cloud_watch_logs_role_arn  = aws_iam_role.cloudtrail-role.arn

  tags = {
    Name = var.cloudtrail_name
  }
}

#CLOUDWATCH LOG GROUP FOR CLOUDTRAIL
resource "aws_cloudwatch_log_group" "cloudtrail-log-group" {
  name              = var.cloudwatch_log_group_name
  retention_in_days = 30
}

#ROLE CLOUDTRAIL
resource "aws_iam_role" "cloudtrail-role" {
  name               = var.cloudtrail_role_name
  assume_role_policy = file("policies/cloudtrailRole.json")
}

#POLICIES S3 BUCKET CLOUDTRAIL
resource "aws_s3_bucket_policy" "cloudtrail-bucket-policy" {
  bucket = aws_s3_bucket.cloudtrail-logs.id
  policy = file("policies/bucketToCloudtrail.json")
}

#POLICIES CLOUDTRAIL CLOUDWATCH
resource "aws_iam_role_policy" "cloudtrail-cloudwatch-policy" {
  name   = var.cloudtrail_policy_name
  role   = aws_iam_role.cloudtrail-role.id
  policy = file("policies/cloudtrailToCloudwatch.json")
}