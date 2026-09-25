terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "tf_yue_felipe"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "bucket-tf-yue-felipe-0101"
  tags = {
    Name        = "bucket-tf-yue-felipe"
    CreateAt    = "2024-06-10"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.bucket.id # O identificador do bucket S3 criado anteriormente
  versioning_configuration {
    status = "Enabled"
  }
}