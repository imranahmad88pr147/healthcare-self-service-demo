terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "app" {
  source = "../../../platform/terraform-modules/app"

  service_name = "patient-service"
  environment  = "dev"
  owner        = "healthcare-team"
}