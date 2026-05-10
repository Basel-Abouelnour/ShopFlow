output "website_url" {
  value       = "http://${module.compute.alb_dns_name}"
  description = "Copy and paste this into your browser"
}
output "asg_name" {
  description = "Auto Scaling Group name for instance refresh on deploy"
  value       = module.compute.asg_name
}
