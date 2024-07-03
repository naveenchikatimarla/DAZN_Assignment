output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_a_id" {
  value = aws_subnet.main_a.id
}

output "subnet_b_id" {
  value = aws_subnet.main_b.id
}

output "security_group_id" {
  value = aws_security_group.web.id
}
