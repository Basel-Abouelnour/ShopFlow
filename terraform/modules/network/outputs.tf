# modules/network/outputs.tf

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main-vpc.id 
}


output "public_subnet_ids" {
  description = "List of public subnet IDs for the ALB"
  value       = [
    aws_subnet.public_1.id, 
    aws_subnet.public_2.id
  ]
}

output "private_subnet_ids" {
  description = "List of private subnet IDs for the ASG"
  value       = [
    aws_subnet.private_1.id, 
    aws_subnet.private_2.id
  ]
}