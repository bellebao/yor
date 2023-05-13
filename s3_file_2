terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "foo" {
  acl = "public-read-write"
  bucket = "systest-tf-log-bucket-bb22"
  versioning {
    enabled = false
  }
  tags = merge({
    Demo = "public-read-write"
  }, {
    yor_trace = "86fdf6d6-d9fb-483c-9502-e1e4f8aaa308"
  })
}
