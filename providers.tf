terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=4.0"
    }
  }
}


provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Name        = "Terraform AWS S3 Static Website Hosting"
      Environment = "Production"
      Owner       = "Rubén López"
      Department  = "devops"
    }
  }
}