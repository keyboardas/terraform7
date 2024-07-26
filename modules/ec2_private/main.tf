resource "aws_instance" "private" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  vpc_security_group_ids = [aws_security_group.private_ec2_sg.id]

  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install net-tools -y

              sudo apt-get install -y apache2
              sudo bash -c 'echo "<h1>This is back end server</h1>" > /var/www/html/index.html'

              sudo systemctl enable apache2
              sudo systemctl start apache2
              EOF

  tags = {
    Name = "private-instance"
  }
}

resource "aws_security_group" "private_ec2_sg" {
  name        = "private-ec2-sg"
  description = "Allow inbound traffic on port 80 from the public subnet"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}