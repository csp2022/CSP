################################################  Computing components  #########################
resource "aws_instance" "mybastionhost" {
ami = "${var.myami}"
instance_type = "t2.medium"
subnet_id = "${var.mypublicsubnet}"
associate_public_ip_address = true
vpc_security_group_ids = ["${var.mybastionsg}"]
key_name = "${var.mykp}"
root_block_device {
  volume_type = "standard"
  volume_size = "9"
  delete_on_termination = "true"
  }
ebs_block_device {
  device_name = "/dev/xvde"
  volume_type = "gp2"
  volume_size = "10"
  }
tags = {
Name = "mybastionhost"
}
}

################################################  Computing components  #########################
resource "aws_instance" "mydbinstance" {
count = 2
ami = "${var.myami}"
instance_type = "t2.medium"
associate_public_ip_address = true
subnet_id = "${var.myprivatesubnet}"
vpc_security_group_ids = ["${var.mysmpdbsg}"]
key_name = "${var.mykp}"
tags = {
Name = "mydb-0${count.index + 1}"
}
}
