terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "s3" {
    bucket = "terraform-infosectrain-remote"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0a38c1c38a15fed74"
  instance_type = "t2.micro"

  tags = {
    Name = "Infosectrain-demo"
  }
}
