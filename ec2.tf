resource "aws_default_vpc" "this" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "jenkins_ec2" {
  ami           = "ami-0acc77abdfc7ed5a6"
  instance_type = "t2.micro"  #var.ec2_instance_type
  key_name      = aws_key_pair.this.key_name   #var.ec2_key_pair

  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_security_group.id]
  user_data                   = file("./jenkins_install.sh")
  # user_data_replace_on_change = true

  tags = {
    Name = "Jenkins-Server"
  }
}
