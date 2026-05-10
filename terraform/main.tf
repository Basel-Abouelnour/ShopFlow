module "network" {
  source = "./modules/network"
  # VPC configuration
  vpc_name               = "main-vpc"
  vpc_cidr               = "10.0.0.0/16"
  vpc_reagion            = "us-east-1"
  availability_zones     = ["us-east-1a", "us-east-1b"]
  ngw_tagname            = "ngw"
  igw_tagname            = "igw"
  public_rtable_tagname  = "public-route-table"
  private_rtable_tagname = "private-route-table"
}
module "iam" {
  source = "./modules/iam"
  
}
module "ecr" {
  source = "./modules/ecr"
  # ECR repository configuration
 # Allow mutable tags for development
}
# module "security" {
#   source = "./modules/security"
#   # Security group configuration
#   vpc_id  = module.network.vpc_id
#   sg_name = "allow_ssh_http"

module "security" {
  source = "./modules/security"
  # Fix: Use the exact name of the output block
  vpc_id = module.network.vpc_id 
}
module "compute" {
  source = "./modules/compute"

  # Replace these with your actual pre-configured network IDs
  vpc_id         = module.network.vpc_id

  alb_subnet_ids = module.network.public_subnet_ids
  asg_subnet_ids = module.network.private_subnet_ids
# Pass outputs from the Security module
  alb_security_group_ids = [module.security.alb_sg_id]
  ec2_security_group_ids = [module.security.ec2_sg_id]
  
  # Replace with a valid AMI ID for your region (e.g., Amazon Linux 2023)
  ami_id                 = "ami-0c94855ba95c71c99" 
  instance_type          = "t3.micro"
}

