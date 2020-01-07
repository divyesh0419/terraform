resource "aws_internet_gateway" "DHP_IGW" {
  vpc_id="${aws_vpc.DHP_VPC.id}"
  tags{
        Name="DHP_IGW"
    }
}
