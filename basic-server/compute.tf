resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id

  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd
                systemctl enable httpd
                echo "Hello from LocalStack EC2 instance!" > /var/www/html/index.html
                EOF

  tags = {
    Name = "${var.project_name}-web-server"
  }


}