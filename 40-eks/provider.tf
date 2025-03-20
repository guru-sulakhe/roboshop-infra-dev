terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.91.0"
        }
    }
    backend "s3" {
        bucket = "guru97s-remote-state"
        key = "roboshop-infra-dev-rds"
        region = "us-east-1"
        dynamodb_table = 
    }
}
provider "aws" {
    region = "us-east-1"
}