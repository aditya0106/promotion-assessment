provider "aws" {
  region = var.region
}

provider "kubernetes" {
  config_path    = "C:\\Users\\adityagupta03\\.kube\\config"
}

provider "helm" {
  kubernetes {
    config_path    = "C:\\Users\\adityagupta03\\.kube\\config"
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-state-aditya"
    key    = "init/terraform.tfstate"
    region = "ap-south-1"
  }
}