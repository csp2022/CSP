
############################################## NACL rules ########################
resource "aws_network_acl" "mybastionnacl" {
  vpc_id = "${var.myvpc}"
  subnet_ids = ["${var.mypublicsubnet}"]

  ingress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
   
  }

  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    
  }
  tags = {
    Name = "mybastionnacl"
  }
}


resource "aws_network_acl" "mysmpdbnacl" {
  vpc_id = "${var.myvpc}"
  subnet_ids = ["${var.myprivatesubnet}"]

  ingress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
   
  }

  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    
  }
  tags = {
    Name = "mysmpdbnacl"
  }
}

