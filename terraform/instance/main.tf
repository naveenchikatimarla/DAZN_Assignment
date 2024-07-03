resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type

  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.subnet_a_id
  associate_public_ip_address = true

  key_name = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker
              service docker start
              aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${var.account_id}.dkr.ecr.${var.region}.amazonaws.com
              docker pull ${var.ecr_repository_url}:latest
              docker run -d -p 80:80 ${var.ecr_repository_url}:latest
              EOF

  tags = {
    Name = "dazn-web"
  }
}
