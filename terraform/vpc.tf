resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/24"
    enable_dns_hostnames = true
    tags = {
        Name = "Espresso VPC"
    }
}

resource "aws_subnet" "subnet1" {
    vpc_id     = aws_vpc.main.id
    cidr_block = "10.0.0.0/25"
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = true
    tags = {
        Name = "Espresso Subnet 1"
    }
}

resource "aws_subnet" "subnet2" {

    vpc_id     = aws_vpc.main.id
    cidr_block = "10.0.0.128/25"
    availability_zone = "us-west-2b"
    map_public_ip_on_launch = true
    tags = {
        Name = "Espresso Subnet 2"
    }
}

resource "aws_internet_gateway" "gateway" {
 vpc_id = aws_vpc.main.id
 
 tags = {
   Name = "Espresso VPC Igateway"
 }
}


resource "aws_route_table" "table" {
 vpc_id = aws_vpc.main.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.gateway.id
 }
 
 tags = {
   Name = "Espresso Table"
 }
}


resource "aws_route_table_association" "public_subnet_asso" {

    subnet_id      = aws_subnet.subnet1.id
    route_table_id = aws_route_table.table.id
}
resource "aws_route_table_association" "public1_subnet_asso" {

    subnet_id      = aws_subnet.subnet2.id
    route_table_id = aws_route_table.table.id
}



resource "aws_security_group" "security_group" {
 name   = "ecs-security-group"
 vpc_id = aws_vpc.main.id

 ingress {
   from_port   = 0
   to_port     = 0
   protocol    = -1
   self        = "false"
   cidr_blocks = ["0.0.0.0/0"]
   description = "any"
 }

 egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}