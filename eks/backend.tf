terraform {
  required_version = ">= 1.9.3, <= 1.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }

  backend "s3" {
    bucket         = "dev-chaitanya-tf-bucket"
    region         = "ap-southeast-2"
    key            = "eks/terraform.tfstate"
    dynamodb_table = "chaitanya-tf-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws-region
}
