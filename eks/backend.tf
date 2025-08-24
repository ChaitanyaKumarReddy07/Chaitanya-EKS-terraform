terraform {
  required_version = "~> 1.9.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
  backend "s3" {
    bucket         = "dev-chaitanya-tf-bucket"   # use the exact bucket name
    region         = "ap-southeast-2"              
    key            = "eks/terraform.tfstate"
    dynamodb_table = "chaitanya-tf-locks"        # exact table name with 's'
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws-region
}
