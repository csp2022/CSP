################################################  Computing components  #########################
resource "aws_instance" "mybastionhost" {
ami = "${var.myami}"
instance_type = "t2.medium"
subnet_id = "${aws_subnet.publicsubnet.id}"
associate_public_ip_address = true
vpc_security_group_ids = ["${aws_security_group.websg.id}"]
key_name = "${aws_key_pair.mykp.id}"
tags = {
Name = "mybastionhostr"
}
}

################################################  Computing components  #########################
resource "aws_instance" "mydbinstance" {
ami = "${var.myami}"
instance_type = "t2.medium"
associate_public_ip_address = true
subnet_id = "${aws_subnet.publicsubnet.id}"
vpc_security_group_ids = ["${aws_security_group.websg.id}"]
key_name = "${aws_key_pair.mykp.id}"
tags = {
Name = "mydb-0${count.index + 1}"
}
}
