resource "aws_eip" "PUBLIC" {
    vpc = true
    tags{
        Name="PUBLIC"
    }
}

resource "aws_nat_gateway" "DHP_NAT_GW" {
  allocation_id = "${aws_eip.PUBLIC.id}"
  subnet_id     = "${aws_subnet.PUBLIC_DHP_SUBNET.id}"

  tags = {
    Name = "DHP_NAT_GW"
  }
}