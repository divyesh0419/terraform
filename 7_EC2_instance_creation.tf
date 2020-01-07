resource "aws_instance" "DHP_EC2_WEB" {
    instance_type="t2.micro"
    ami="${var.ami_image_id}"
    key_name="dhp_kep_pair"
    subnet_id="${aws_subnet.PUBLIC_DHP_SUBNET.id}"
    availability_zone="${var.Public_availability_zone}"
    associate_public_ip_address="true"
    security_groups=["${aws_security_group.DHP_allow_all.id}"]
    
    tags{
        Name="Public_Web"
    }
    #provisioner "local-exec" {
     #   command = "sudo yum install httpd -y"
      #  command = "sudo /etc/init.d/httpd start"
       # command = "echo 'This is Ohio serve' > /var/www/html/index.html"
       # }
}

resource "aws_instance" "DHP_EC2_DB" {
    instance_type="t2.micro"
    ami="${var.ami_image_id}"
    key_name="dhp_kep_pair"
    subnet_id="${aws_subnet.PRIVATE_DHP_SUBNET.id}"
    availability_zone="${var.Private_availability_zone}"
    associate_public_ip_address="false"
    security_groups=["${aws_security_group.DHP_PRIVATE.id}"]
    
    
    tags{
        Name="PRIVATE_DB"
    }
}
