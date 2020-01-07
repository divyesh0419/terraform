resource "aws_security_group" "DHP_allow_all" {
  name        = "DHP_allow_all"
  description = "Allow all inbound traffic"
  vpc_id="${aws_vpc.DHP_VPC.id}"
  
    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    }
     tags{
        Name="DHP_allow_all"
    }
}

resource "aws_security_group" "DHP_PRIVATE" {
  name        = "DHP_PRIVATE"
  description = "Allow from web server only"
  vpc_id="${aws_vpc.DHP_VPC.id}"
  
    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["10.1.0.0/26"]
    }
    egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    }
    tags{
        Name="DHP_PRIVATE"
    }
}