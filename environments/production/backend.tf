
terraform {
  required_version = "~> 1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "ecommerce-terraform-state-851771533724"
    key            = "production/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ecommerce-terraform-locks"
    encrypt        = true
    # kms_key_id = "arn:aws:kms:us-east-1:851771533724:key/<key-id>"  # Uncomment for CMK
  }
}

provider "aws" {
  region = var.aws_region

  # All resources get these tags automatically
  default_tags {
    tags = {
      Environment   = var.environment
      Project       = "ecommerce"
      ManagedBy     = "terraform"
      CostCenter    = "platform-engineering"
      DataClass     = "confidential"
      OnCallTeam    = "sre"
      LastUpdatedBy = "terraform"
    }
  }
}
