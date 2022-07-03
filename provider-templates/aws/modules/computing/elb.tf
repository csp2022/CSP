resource "aws_elb" "myelb" {
  name               = "myelb"
 # availability_zones = ["us-east-1a", "us-east-1b"]
  subnets = ["${var.mypublicsubnet}", "${var.lb-subnet2}"]
  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  instances                   = ["${aws_instance.mydbinstance[0].id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  tags = {
    Name = "myelb"
  }
}