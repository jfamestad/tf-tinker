terraform {
  backend "s3" {
    bucket = "joshtf"
    key = "dev/tf-tinker"
    region = "us-west-2"  # This does not have to be the region we are deploying to, its just our remote state
  }
}

provider "aws" {
  profile = "ivaf-sandbox"
  region = "us-west-2"
}

variable "bucket-name" {
  type = string
  default = "super-secret-stuff-no-hackers-allowed"
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket-name
  
  tags = {
    Name = "Super Secret Stuff"
    Environment = "Dev"
  }
}
