resource "aws_subnet" "PUBLIC_DHP_SUBNET" {
    cidr_block="${var.public_subnet_cidr_block}"
    availability_zone="${var.Public_availability_zone}"
    vpc_id="${aws_vpc.DHP_VPC.id}"
    tags{
        Name="PUBLIC_DHP_SUBNET"
    }
    
 }

 resource "aws_subnet" "PRIVATE_DHP_SUBNET" {
    cidr_block="${var.private_subnet_cidr_block}"
    availability_zone="${var.Private_availability_zone}"
    vpc_id="${aws_vpc.DHP_VPC.id}"
    tags{
        Name="PRIVATE_DHP_SUBNET"
    }
    
 }