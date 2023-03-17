variable "region" {
    default = "us-east-1"
}

variable "domain_name" {
  type        = string
  description = "The domain name for the website."
}

variable "bucket_name" {
	type = string
	description = "The name of the bucket"
}

variable "acl_value" {
    description = "acl_value for s3"
}

variable "common_tags" {
  description = "Common tags for all components."
}

# variable "access_key" {
#   description = "access_key to access aws"
# }

# variable "security_key" {
#   description = "security_key to access aws"
# }
# for security, advised not to store these two variables in tf
