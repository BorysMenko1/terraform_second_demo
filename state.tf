terraform {
  required_version = "~> 1.3"

    backend "s3" {
    bucket         = "retraining-secnd-demo-cc-tf"
    key            = "tf-infra/terraform.tfstate"
    region         = "eu-central-1"
    }

  # backend "local" {

  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}