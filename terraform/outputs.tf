output "instance_id" {
  value = module.instance.instance_id
}

output "lb_dns_name" {
  value = module.load_balancer.lb_dns_name
}
