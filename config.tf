terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "backend-archive-dev"
    key            = "dev/2-tier-app.tfstate"
    encrypt        = true
    region         = "us-east-1"
    dynamodb_table = "tf-backend-archive"
  }
}

provider "aws" {
  region = "us-east-1"
}

