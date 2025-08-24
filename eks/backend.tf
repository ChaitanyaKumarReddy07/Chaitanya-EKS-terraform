terraform {
  required_version = "~> 1.9.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }

  backend "s3" {
    bucket         = "dev-chaitanya-tf-bucket"    # Ensure this bucket exists in ap-southeast-2
    region         = "ap-southeast-2"             # Region of the bucket and DynamoDB
    key            = "eks/terraform.tfstate"      # Path inside the bucket for tfstate
    dynamodb_table = "chaitanya-tf-locks"         # Ensure the exact table name exists in same region
    encrypt        = true
  }
}
