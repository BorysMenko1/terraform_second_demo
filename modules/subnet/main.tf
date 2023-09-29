# module "vpc_moodule" {
#   source = "../vpc"
# }

resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
}

# resource "aws_subnet" "public_b" {
#   vpc_id            = var.vpc_id
#   cidr_block        = var.public_subnet_cidr_b
#   availability_zone = var.availability_zone_b
# }

# resource "aws_db_subnet_group" "db_subnet_group" {
#   name       = var.db_subnet_group_name
#   subnet_ids = [ aws_subnet.public.id]
# }

resource "aws_internet_gateway" "igw" {
  vpc_id     = var.vpc_id
  depends_on = [aws_subnet.public]
}

resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.route_table_cidr
    gateway_id = aws_internet_gateway.igw.id
  }
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id

  depends_on = [aws_subnet.public, aws_route_table.public_rt]
}