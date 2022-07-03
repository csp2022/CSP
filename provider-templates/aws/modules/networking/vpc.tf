############### VPC creation ##############
resource "aws_vpc" "myvpc"{
cidr_block = "${var.mycidr}"
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


############################################ Public Subnets ###############################3
resource "aws_subnet" "mypublicsubnet"{
vpc_id = "${aws_vpc.myvpc.id}"
cidr_block = "10.0.10.0/24"
availability_zone = "us-east-1a"
tags={
Name = "mypublicsubnet"
}
}

resource "aws_route_table" "publicrtb"{
vpc_id = "${aws_vpc.myvpc.id}"
tags = {
Name = "mypublicrtb"
}
}

resource "aws_route" "publicrt"{
route_table_id = "${aws_route_table.publicrtb.id}"
destination_cidr_block = "0.0.0.0/0"
gateway_id = "${aws_internet_gateway.myigw.id}"
}
 
resource "aws_route_table_association" "publicrtba"{
route_table_id = "${aws_route_table.publicrtb.id}"
subnet_id = "${aws_subnet.mypublicsubnet.id}"
}


############################################ LB Subnets ###############################3
resource "aws_subnet" "lb-subnet2"{
vpc_id = "${aws_vpc.myvpc.id}"
cidr_block = "10.0.20.0/24"
availability_zone = "us-east-1b"
tags={
Name = "lb-subnet2"
}
}

resource "aws_route_table_association" "lbrtba2"{
route_table_id = "${aws_route_table.publicrtb.id}"
subnet_id = "${aws_subnet.lb-subnet2.id}"
}

############################################ Private Subnets ###############################3
resource "aws_subnet" "myprivatesubnet"{
vpc_id = "${aws_vpc.myvpc.id}"
cidr_block = "10.0.30.0/24"
availability_zone = "us-east-1b"
tags={
Name = "myprivatesubnet"
}
}

resource "aws_route_table" "privatertb"{
vpc_id = "${aws_vpc.myvpc.id}"
tags = {
Name = "myprivatertb"
}
}

resource "aws_route" "privatert"{
route_table_id = "${aws_route_table.privatertb.id}"
destination_cidr_block = "10.0.30.0/24"
network_interface_id = "${var.mybastionhostnic}"
}

resource "aws_route_table_association" "privatertba"{
route_table_id = "${aws_route_table.privatertb.id}"
subnet_id = "${aws_subnet.myprivatesubnet.id}"
}


####################################### AWS RDS DB subnet group ##############################


resource "aws_subnet" "rds_subnet1" {
  vpc_id       = "${aws_vpc.myvpc.id}"
  cidr_block = "10.0.50.0/24"
  availability_zone = "us-east-1e"
  tags = {
    Name = "rds-subnet1"
  }
}

resource "aws_subnet" "rds_subnet2" {
  vpc_id       = "${aws_vpc.myvpc.id}"
  cidr_block = "10.0.60.0/24"
  availability_zone = "us-east-1f"
  tags = {
    Name = "rds-subnet2"
  }
}

resource "aws_db_subnet_group" "mydbsubnetgroup" {
  name       = "mydbsubnetgroup"
  subnet_ids = ["${aws_subnet.rds_subnet1.id}","${aws_subnet.rds_subnet2.id}"]
  tags = {
    Name = "My DB subnet group"
  }
}
