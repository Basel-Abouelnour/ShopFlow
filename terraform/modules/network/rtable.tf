resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.public_rtable_tagname
  }
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = var.private_rtable_tagname
  }
}
# Associate public subnets with the route table
# modules/network/rtable.tf

# --- Public Route Table Associations ---
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  # NOTE: Keep your existing route_table_id variable name here
  route_table_id = aws_route_table.public.id # Change if your RT has a different name
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id # Change if your RT has a different name
}

# --- Private Route Table Associations ---
resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  # NOTE: Keep your existing route_table_id variable name here
  route_table_id = aws_route_table.private.id # Change if your RT has a different name
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id # Change if your RT has a different name
}