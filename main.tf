terraform {
  backend "remote" {
    hostname = app.terraform.io
    organization = "FamestadDevIV"
    workspaces {
      prefix = "dev-"
    }
  }
}

provider "aws" {
  profile = "ivaf-sandbox"
  region = "us-west-2"
}

variable "bucket_name" {
  type = string
  default = "super-secret-stuff-no-hackers-allowed"
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  
  tags = {
    Name = "Super Secret Stuff"
    Environment = "Dev"
  }
}
