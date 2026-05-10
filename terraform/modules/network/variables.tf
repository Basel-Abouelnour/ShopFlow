variable "vpc_name" {
  type        = string
  default     = "main-vpc"
  description = "provide a tag name for the vpc"
}
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "provide a cidr for the vpc"
}
variable "vpc_reagion" {
  type        = string
  default     = "us-east"
  description = "provide a region for the vpc"
}

variable "public_subnet_name" {
  type        = string
  default     = "public-subnet"
  description = "Base tag name for the public subnets"
}

variable "private_subnet_name" {
  type        = string
  default     = "private-subnet"
  description = "Base tag name for the private subnets"
}

# CHANGED to a list so each subnet gets a unique range
variable "public_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "List of CIDR blocks for the public subnets"
}

# CHANGED to a list to support two private subnets
variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
  description = "List of CIDR blocks for the private subnets"
}

variable "availability_zones" {
  description = "AZs to distribute subnets across"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "ngw_tagname" {
  type        = string
  default     = "ngw"
  description = "provide a name for nat gateway"
}
variable "igw_tagname" {
  type        = string
  default     = "igw"
  description = "provide a name for nat gateway"
}
variable "public_rtable_tagname" {
  type        = string
  default     = "public-route-table"
  description = "provide a name for public route table"
}
variable "private_rtable_tagname" {
  type        = string
  default     = "private-route-table"
  description = "provide a name for private route table"
}