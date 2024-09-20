#main vpc (Virtual private Cloud)
resource "aws_vpc" "main" {
	cidr_block= var.cidr
	enable_dns_support=true
	enable_dns_hostnames=true
	tags={
		Name="main-vpc"
	}
}

##Subnets
#public subnet

resource "aws_subnet" "public_subnet" {
	vpc_id = aws_vpc.main.id
	cidr_block = var.cidr_public_subnet
	availability_zone = "ap-south-1"	
	map_public_ip_on_launch = true
	tags = {
		Name = "public_subnet"
	}
}

#private subnet

resource "aws_subnet" "private_subnet" {
        vpc_id = aws_vpc.main.id
        cidr_block = var.cidr_private_subnet
        availability_zone = "ap-south-1"
        map_public_ip_on_launch = true
        tags = {
                Name = "private_subnet"
        }
}

#Internet Gateway

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-internet-gateway"
  }
}

#Routing table for public

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public-route-table"
  }
}

#Associating Routing with public address

resource "aws_route_table_association" "public_association" {
	subnet_id=aws_subnet.public_subnet.id
	route_table_id=aws_route_table.public.id
}


##Security group


resource "aws_security_group" "g1" {
	vpc_id=aws_vpc.main.id
	name="Security Group 1"
	ingress {
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]  
  }
	egress{
		from_port   = 0
		to_port	    = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	tags = {
		Name="main_web_security_group"
	}
}
## resource for ssh access

resource "aws_security_group" "ssh" {
  name        = "ssh-access"
  description = "Allow SSH access"
  vpc_id      = aws_vpc.main.id  # Make sure to provide your VPC ID

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change this to restrict access to your IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 tags = {
    Name = "SSH Security Group"
  }
}
