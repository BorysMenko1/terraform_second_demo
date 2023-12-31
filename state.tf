terraform {
  required_version = "~> 1.3"

  backend "s3" {
    bucket = "retraining-secnd-demo-cc-tf"
    key    = "tf-infra/terraform.tfstate"
    region = "eu-central-1"
  }

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.21.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}