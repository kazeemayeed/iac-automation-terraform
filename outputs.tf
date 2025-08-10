output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}

output "load_balancer_dns" {
  description = "Load balancer DNS name"
  value       = module.compute.load_balancer_dns
}

output "website_url" {
  description = "Website URL"
  value       = "http://${module.compute.load_balancer_dns}"
}
