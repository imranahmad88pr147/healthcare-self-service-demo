terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

module "app" {
  source = "../../../platform/terraform-modules/app"

  service_name = "patient-service"
}