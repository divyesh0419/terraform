
#For Public Subnet
resource "aws_route_table" "DHP_ROUTE_TABLE" {
    vpc_id="${aws_vpc.DHP_VPC.id}"
    route{
        cidr_block="${var.cidr_block_route_mapping}"
        gateway_id ="${aws_internet_gateway.DHP_IGW.id}"

    }
    tags{
        Name="DHP_ROUTE_TABLE"
    }
   
}
resource "aws_route_table_association" "DHP_public_association" {
    subnet_id = "${aws_subnet.PUBLIC_DHP_SUBNET.id}"
    route_table_id = "${aws_route_table.DHP_ROUTE_TABLE.id}"
}

#For Private Subnet
resource "aws_route_table" "Private_DHP_ROUTE_TABLE" {
    vpc_id="${aws_vpc.DHP_VPC.id}"
    route{
        cidr_block="${var.cidr_block_route_mapping}"
        nat_gateway_id="${aws_nat_gateway.DHP_NAT_GW.id}"
        }
        tags{
        Name="Private_DHP_ROUTE_TABLE"
    }
   
}

resource "aws_route_table_association" "DHP_private_association" {
    subnet_id = "${aws_subnet.PRIVATE_DHP_SUBNET.id}"
    route_table_id = "${aws_route_table.Private_DHP_ROUTE_TABLE.id}"
}

#Setting Public Route to Main as YES

resource "aws_main_route_table_association" "DHP_SET_TO_MAIN" {
    vpc_id="${aws_vpc.DHP_VPC.id}"
    route_table_id="${aws_route_table.DHP_ROUTE_TABLE.id}"
}