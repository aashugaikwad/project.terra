resource "aws_subnet" "public" {
  count             = 2
  vpc_id            = vpc-0418c34f8641d4c01
  cidr_block        = cidrsubnet(10.0.0.0/24, 8, count.index)
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "k8s-public-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = vpc-0418c34f8641d4c01
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index + 2)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "k8s-private-${count.index}"
  }
}

