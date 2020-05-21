#!/bin/bash
echo "---user adding----"
sudo useradd user
echo "---set passowrd for a user----"
sudo echo "oracle123" | passwd --stdin dpanchal
echo "=====Apache Installation====="
sudo yum install httpd -y 
sudo /etc/init.d/httpd start
echo "This is Ohio server" > /var/www/html/index.html 
chkconfig httpd on 
echo "---ssh modification-----"
sudo sed -i s'/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo /etc/init.d/sshd reload
echo "-----------Switching to root user login ------------"
sudo su -
echo "root123" | passwd --stdin root
echo "##adding sudo access#####"
echo " " >> /etc/sudoers
echo "dpanchal        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
echo " " >> /etc/sudoers
exit 0
