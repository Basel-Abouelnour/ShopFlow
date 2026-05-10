variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "alb_subnet_ids" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "asg_subnet_ids" {
  description = "List of subnet IDs for the EC2 instances (private or public)"
  type        = list(string)
}

variable "alb_security_group_ids" {
  description = "Security groups for the ALB (should allow port 80/443 from internet)"
  type        = list(string)
}

variable "ec2_security_group_ids" {
  description = "Security groups for EC2 instances (should allow port 80 from ALB SG)"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}