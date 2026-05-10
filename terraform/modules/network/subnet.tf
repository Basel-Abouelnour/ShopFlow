resource "aws_subnet" "public-subnet" {
    tags = {
        Name = var.public_subnet_name
    }
  vpc_id = aws_vpc.main-vpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.availability_zones[0]
}
resource "aws_subnet" "private-subnet" {
    tags = {
        Name = var.private_subnet_name
    }
  vpc_id = aws_vpc.main-vpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.availability_zones[0]
}