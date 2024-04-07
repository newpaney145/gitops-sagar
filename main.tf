provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "sagar-gitops-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "sagar_dynamodb"
    encrypt        = true
  }
}


resource "aws_s3_bucket" "intern-s3-bucket" {
  bucket = var.tf_frontend_bucket
  tags = {
      "Name" = "sagar-bucket",
      "Creator" = "sagarnewpaney144@gmail.com",
      "Project" = "Intern",
      "Deletable" = "yes"
    }

}
