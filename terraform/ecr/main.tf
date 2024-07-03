resource "aws_ecr_repository" "web" {
  name                 = "webimage"
  image_tag_mutability = "MUTABLE"
}

resource "null_resource" "ecr_push" {
  provisioner "local-exec" {
    command = <<EOF
      aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${var.account_id}.dkr.ecr.${var.region}.amazonaws.com
      docker tag webimage:latest ${aws_ecr_repository.web.repository_url}:latest
      docker push ${aws_ecr_repository.web.repository_url}:latest
    EOF
  }
}
