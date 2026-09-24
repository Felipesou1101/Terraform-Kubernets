terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.66.0"
    }
  }
}

resource "aws_s3_bucket" "Meu-Bucket" {
    bucket = "meu-bucket-exemplo"

    tags = {
        Name        = "Meu Bucket"
        Environment = "Dev"
    }  
}