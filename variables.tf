//RESOURCES
variable "bucket_warehouse_name" {
  description = "Name bucket S3 to warehouse"
  type        = string
  default     = "warehouse-bucket-terraform-vinihemming"
}


variable "bucket_cloudtrail_logs_name" {
  description = "Name bucket S3 logs CloudTrail"
  type        = string
  default     = "cloudtrail-logs-bucket-vinihemming"
}


variable "instance_ami" {
  description = "AMI EC2"
  type        = string
  default     = "ami-05b10e08d247fb927"
}


variable "instance_type" {
  description = "Type EC2"
  type        = string
  default     = "t2.micro"
}


variable "cloudtrail_name" {
  description = "Name CloudTrail"
  type        = string
  default     = "cloudtrail-logs"
}


variable "cloudwatch_log_group_name" {
  description = "Name grupo logs CloudWatch"
  type        = string
  default     = "/awscloudtrail/cloudtrail-logs"
}


variable "cloudtrail_role_name" {
  description = "Name role CloudTrail"
  type        = string
  default     = "cloudtrail-role"
}


variable "cloudtrail_policy_name" {
  description = "Name policy CloudTrail to CloudWatch"
  type        = string
  default     = "cloudtrail-cloudwatch-policy"
}

//USERS
variable "bucket_user_name" {
  description = "Name user IAM bucket"
  type        = string
  default     = "bucket-user"
}


variable "ec2_user_name" {
  description = "Name user IAM  EC2"
  type        = string
  default     = "ec2-user"
}


variable "bucket_policy_name" {
  description = "Name policy bucket"
  type        = string
  default     = "BucketPolicy"
}

variable "ec2_policy_name" {
  description = "Name policy EC2"
  type        = string
  default     = "EC2Policy"
}