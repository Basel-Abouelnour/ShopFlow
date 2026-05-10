resource "aws_nat_gateway" "main-ng" {
    tags = {
        Name = var.ngw_tagname
    }
  allocation_id = aws_eip.ngw-eip.id
  subnet_id = aws_subnet.public_1.id
}
resource "aws_eip" "ngw-eip" {
    tags = {
        Name = var.ngw_tagname
    }

}