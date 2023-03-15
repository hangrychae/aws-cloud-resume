
terraform {
	required_version = "~> 1.4.0"

  	required_providers {
    	aws = {
      	source  = "hashicorp/aws"
      	version = "~> 4.0"
    	}
  	}

  backend "s3" {
    bucket = "chaecloudresume"
    key    = "prod/terraform.tfstate"
	profile = "terraform"
    region = "us-east-1"
  }
}

provider "aws" {
  	region = "us-east-1"
  	# access_key = var.access_key
	# secret_key = var.security_key
}

provider "aws" {
  	alias  = "acm_provider"
  	region = "us-east-1"
}