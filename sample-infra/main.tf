terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "terraform-backend-state-aditya"
    key    = "s3-bucket/terraform.tfstate"
    region = "ap-south-1"
  }

}
provider "aws" {
  region = "ap-south-1"
  default_tags {
    tags = {
      "Project" = "Promotion Assessment"
      "Environment"    = "Dev"
    }
  }
}


resource "aws_s3_bucket" "example" {
  bucket = "terraform-backend-state-aditya-v2"

}
