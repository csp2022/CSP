
##############################################  Security Groups ########################
resource "aws_security_group" "mybastionsg" {
  name        = "mybastionsg"
  description = "Allow only for 22 port"
  vpc_id = "${var.myvpc}"
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
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
    Name = "mybastionsg"
  }
}


resource "aws_security_group" "mysmpdbsg" {
  name        = "mysmpdbsg"
  description = "Allow only for 22 port"
  vpc_id = "${var.myvpc}"
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "-1"
    security_groups = ["${aws_security_group.mybastionsg.id}"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "mysmpdbsg"
  }
}
