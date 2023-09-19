terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
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
    key    = "cognito/terraform.tfstate"
    region = "ap-south-1"
  }
}

module "user_pool" {

  user-pool-name               = "${var.user-pool-name}"
  app-domain-name              = "${var.app-domain-name}"
  resource-server-name         = "${var.resource-server-name}"
  app-clients                  = "${var.app-clients}"
  scopes                       = "${var.scopes}"
  source                       = "./modules/user-pool"
}
