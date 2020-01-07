provider "aws" {
    access_key="${var.aws_access_key}"
    secret_key="${var.aws_secret_key}"
    region="${var.place}"
  
}

resource "aws_vpc" "DHP_VPC" {
    cidr_block="${var.vpc_cidr_block}"
    tags{
        Name="VPC_DHP"
    }
  
}