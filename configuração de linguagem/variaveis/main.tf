resource "aws_s3_bucket" "Meu-Bucket" {
    bucket = "meu-bucket-exemplo"

    tags = {
        Name        = "Meu Bucket"
        Environment = "Dev"
    }  
}