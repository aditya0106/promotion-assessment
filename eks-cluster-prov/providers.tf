terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
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

terraform {
  backend "s3" {
    bucket = "terraform-backend-state-aditya"
    key    = "prov/terraform.tfstate"
    region = "ap-south-1"
  }
}
