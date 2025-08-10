output "load_balancer_dns" {
  description = "Load balancer DNS name"
  value       = aws_lb.main.dns_name
}

output "security_group_id" {
  description = "Security group ID"
  value       = aws_security_group.web.id
}
