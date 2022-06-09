terraform {
  cloud {
    organization = "bearalliance"
    workspaces {
      name = "learn-java"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-2f442839"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
