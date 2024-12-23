resource "aws_default_vpc" "this" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "jenkins" {
  ami           = "ami-0acc77abdfc7ed5a6"
  instance_type = "t2.medium"
  key_name      = aws_key_pair.this.key_name

  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins.id]
  user_data                   = file("./jenkins_install.sh")

  tags = {
    Name = "Jenkins Server"
  }
}
