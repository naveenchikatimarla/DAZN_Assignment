resource "aws_ecr_repository" "web" {
  name                 = "webimage"
  image_tag_mutability = "MUTABLE"
}

resource "null_resource" "ecr_push" {
  depends_on = [aws_ecr_repository.web]

  provisioner "local-exec" {
    interpreter = ["PowerShell", "-Command"]
    command = <<EOF
      aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${var.account_id}.dkr.ecr.${var.region}.amazonaws.com;
      docker build -t webimage .;
      docker tag webimage:latest ${aws_ecr_repository.web.repository_url}:latest;
      docker push ${aws_ecr_repository.web.repository_url}:latest;
    EOF
  }
}
