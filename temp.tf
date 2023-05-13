terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "systest-tf-log-bucket"
  tags = {
    Demo                 = "log-delivery-write"
    git_commit           = "7624fd80bc06b336e9bc07e0146ea7044357093f"
    git_file             = "temp.tf"
    git_last_modified_at = "2023-05-13 00:06:40"
    git_last_modified_by = "belle.bao@gmail.com"
    git_modifiers        = "belle.bao"
    git_org              = "bellebao"
    git_repo             = "yor"
    yor_trace            = "6b6edf57-f55b-4b37-82da-823589fbfa65"
  }
}
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.log_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "log_bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.example]
  bucket     = aws_s3_bucket.log_bucket.id
  acl        = "log-delivery-write"
}
