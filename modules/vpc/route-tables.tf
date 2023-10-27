# Setting up Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-public-route-table",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

# Setting up route in Public Route Table to be used for Internet gateway
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_internet_gateway.main.id
}

# Setting up Private Route Table 

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-private-route-table",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

# Setting up Route in Private Route Table pointing to NAT Gateway

resource "aws_route" "private" {
  count                  = var.create_nat_gateway ? 1 : 0
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = var.destination_cidr_block
  nat_gateway_id         = aws_nat_gateway.main[count.index].id
}






