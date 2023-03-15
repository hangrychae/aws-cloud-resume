# deprecated arguments exist in newer version. Hence, using website configuration resource will be better 
# resource "aws_s3_bucket" "chaecloudresume" {
# 	bucket = "${var.bucket_name}"
# 	acl = "${var.acl_value}"   
# 	policy = jsonencode({
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Sid": "PublicReadGetObject",
#             "Effect": "Allow",
#             "Principal": "*",
#             "Action": "s3:GetObject",
#             "Resource": "arn:aws:s3:::chaecloudresume/*"
#         }
#     ]
# })
# 	cors_rule {
#     	allowed_headers = ["Authorization", "Content-Length"]
#     	allowed_methods = ["GET", "POST"]
#     	allowed_origins = ["*"]
#     	max_age_seconds = 15
#   	}

# 	website {
#     	index_document = "index.html"
#     	# error_document = "404.html"
#   	}
# 	tags = var.common_tags
# }



	resource "aws_s3_bucket" "chaecloudresume" {
	bucket = var.bucket_name
	}

	resource "aws_s3_bucket_policy" "s3-policy" {
	bucket = aws_s3_bucket.chaecloudresume.bucket
	policy = templatefile("s3-policy.json", { bucket = var.bucket_name })
	}

	resource "aws_s3_bucket_acl" "s3-acl" {
	bucket = aws_s3_bucket.chaecloudresume.bucket
	acl    = var.acl_value
	}

	resource "aws_s3_bucket_website_configuration" "chaecloudresume-config" {
	bucket = aws_s3_bucket.chaecloudresume.bucket
	index_document {
    	suffix = "index.html"
  	}
	# TODO
	# error_document {
    # key = "error.html"
  	# }

	}	