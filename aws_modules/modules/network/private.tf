resource "aws_subnet" "private_subnet_1a" {
    vpc_id = aws_vpc.cluster_vpc.id
    cidr_block = var.private_subnet_1a_cidr_block

    availability_zone = format("%sa", var.aws_region)

    tags = {
        Name = format("%s-private-1a", var.cluster_name),
        "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    }
}

resource "aws_subnet" "private_subnet_1c" {
    vpc_id = aws_vpc.cluster_vpc.id
    cidr_block = var.private_subnet_1c_cidr_block

    availability_zone = format("%sc", var.aws_region)

    tags = {
        Name = format("%s-private-1c", var.cluster_name),
        "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    }
}

resource "aws_route_table_association" "private1a" {
  subnet_id = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.nat.id
}

resource "aws_route_table_association" "private1c" {
  subnet_id = aws_subnet.private_subnet_1c.id
  route_table_id = aws_route_table.nat.id
}