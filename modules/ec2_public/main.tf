resource "aws_instance" "public" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install net-tools -y

              sudo apt-get install -y apache2
              sudo bash -c 'echo "<h1>Hello, real devops world!</h1><br /><h1>This is front end server</h1>" > /var/www/html/index.html'

              sudo systemctl enable apache2
              sudo systemctl start apache2
              EOF

  tags = {
    Name = "public-instance"
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow inbound traffic from ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_ip]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#resource "aws_eip" "main" {
#  instance = aws_instance.public.id
#  domain   = "vpc"
#}

#resource "aws_eip_association" "main" {
#  instance_id = aws_instance.public.id
#  allocation_id = aws_eip.main.id
#}