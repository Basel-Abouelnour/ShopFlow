output "alb_dns" {
  value       = "http://${module.compute.alb_dns_name}"
  description = "Copy and paste this into your browser"
}
output "asg_name" {
  description = "Auto Scaling Group name for instance refresh on deploy"
  value       = module.compute.asg_name
}
output "ecr_url" {
  description = "URL for the created ecr repo"
  value       = module.ecr.repository_url
}
