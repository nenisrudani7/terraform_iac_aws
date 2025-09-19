terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.13.0"
    }
  }
  #  backend "s3" {

  # } 
}

provider "aws" {
  region = "us-east-1"
  # if you have any iam user then add creds here
  # access_key = ""
  # secret_key = ""
}

