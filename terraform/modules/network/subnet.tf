# --- Public Subnets ---
resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.public_subnet_cidrs[0] # "10.0.1.0/24"
  availability_zone = var.availability_zones[0]  # "us-east-1a"

  tags = {
    Name = "${var.public_subnet_name}-1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.public_subnet_cidrs[1] # "10.0.2.0/24"
  availability_zone = var.availability_zones[1]  # "us-east-1b"

  tags = {
    Name = "${var.public_subnet_name}-2"
  }
}

# --- Private Subnets ---
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.private_subnet_cidrs[0] # "10.0.3.0/24"
  availability_zone = var.availability_zones[0]   # "us-east-1a"

  tags = {
    Name = "${var.private_subnet_name}-1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.private_subnet_cidrs[1] # "10.0.4.0/24"
  availability_zone = var.availability_zones[1]   # "us-east-1b"

  tags = {
    Name = "${var.private_subnet_name}-2"
  }
}