resource "aws_elb" "elb-server" {
  name               = "elb-server"
 # availability_zones = ["us-east-1a", "us-east-1b"]
  subnets = ["${var.lb-subnet1}", "${var.lb-subnet2}"]
  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  instances                   = ["${aws_instance.webapp-server-1.id}","${aws_instance.webapp-server-2.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  tags = {
    Name = "elb-server"
  }
}