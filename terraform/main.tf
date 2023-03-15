# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 4.0"
#     }
#   }
# }

# Configure the AWS Provider
# provider "aws" {
#     access_key = "${var.aws_access_key}"
#     secret_key = "${var.aws_secret_key}"
#     region = "${var.region}"
# }

# # s3 bucket 

# module "s3" {
#     source = "<path-to-S3-folder>"
#     #bucket name should be unique
#     bucket_name = "${var.bucket_name}"
# }