############################################ Networking modules ######################
resource "aws_vpc" "myvpc"{
cidr_block = "10.0.0.0/16"
tags ={
Name = "myvpc"
}
}

resource "aws_internet_gateway" "myigw"{
vpc_id = "${aws_vpc.myvpc.id}"
tags={
Name = "myigw"
}
}

resource "aws_subnet" "publicsubnet"{
vpc_id = "${aws_vpc.myvpc.id}"
cidr_block = "10.0.1.0/24"
tags={
Name = "publicsubnet"
}
}

resource "aws_route_table" "publicrtb"{
vpc_id = "${aws_vpc.myvpc.id}"
tags = {
Name = "publicrtb"
}
}

resource "aws_route" "publicrt"{
route_table_id = "${aws_route_table.publicrtb.id}"
destination_cidr_block = "0.0.0.0/0"
gateway_id = "${aws_internet_gateway.myigw.id}"
}
 
resource "aws_route_table_association" "publicrtba"{
route_table_id = "${aws_route_table.publicrtb.id}"
subnet_id = "${aws_subnet.publicsubnet.id}"
}

##############################################  Security Modules ########################
resource "aws_key_pair" "mykp" {
  key_name   = "mykp"
  public_key = "${var.mykey}"
}

resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.myvpc.id
  subnet_ids = ["${aws_subnet.publicsubnet.id}"]
  egress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "mynacl"
  }
}

resource "aws_security_group" "websg" {
  name        = "websg"
  description = "Allow all traffic"
  vpc_id ="${aws_vpc.myvpc.id}"
  ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "websg"
  }
}

################################################  web server #########################
resource "aws_instance" "webserver" {
ami = "${var.myami}"
instance_type = "t2.medium"
associate_public_ip_address = true
subnet_id = "${aws_subnet.publicsubnet.id}"
vpc_security_group_ids = ["${aws_security_group.websg.id}"]
key_name = "${aws_key_pair.mykp.id}"
tags = {
Name = "webserver"
}
}
