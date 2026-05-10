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
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public.id
}
# Associate private subnets with the route table
resource "aws_route_table_association" "private" {

  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private.id
}
