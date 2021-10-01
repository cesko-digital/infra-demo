terraform {
  required_version = "= 0.15.4"

  required_providers {
    aws = ">= 3.28.0"
  }

  backend "s3" {
    bucket = "1-terraform-cd-demo-state"
    key = "terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "data-bucket" {
  bucket = "1-terraform-cd-demo"
  acl    = "private"
}

output "s3-arn" {
  value = aws_s3_bucket.data-bucket.arn
}
