# resource "aws_vpc" "main" { 
#  cidr_block = var.base_cidr_block 
# } 

# < TIPO DE BLOCO > "<RÓTULO DO BLOCO>" "<RÓTULO DO BLOCO>" { 
# Corpo do bloco 
#  < IDENTIFICADOR > = < EXPRESSÃO > # Argumento 
# }

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

variable "aws_region" {}

variable "base_cidr_block" {
  description = "A /16 CIDR range definition, such as 10.1.0.0/16, that the VPC will use"
  default = "10.1.0.0/16"
}

variable "availability_zones" {
  description = "A list of availability zones in which to create subnets"
  type = list(string)
}

provider "aws" {
  region = var.aws_region
}
