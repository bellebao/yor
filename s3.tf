terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "foo" {
  acl    = "public-read-write"
  bucket = "systest-tf-log-bucket-bb22"
  versioning {
    enabled = false
  }
  tags = merge({
    Demo = "public-read-write"
    }, {
    yor_trace = "86fdf6d6-d9fb-483c-9502-e1e4f8aaa308"
    }, {
    git_commit           = "61a74baf41c942b8aa69fe6af80a7220ac3a19b1"
    git_file             = "s3.tf"
    git_last_modified_at = "2023-05-13 00:15:30"
    git_last_modified_by = "belle.bao@gmail.com"
    git_modifiers        = "belle.bao"
    git_org              = "bellebao"
    git_repo             = "yor"
  })
}
