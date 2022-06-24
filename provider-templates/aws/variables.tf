variable "myregion"{
type = "string"
default = "us-east-1"
}

variable "myamiid"{
type = "string"
}
variable "mykeypair"{
type = "string"
}

#variable "mytags"{
#type = "map"
#default = {
#"fname" = "krishna"
#"lname" = "maram"
#}
#}

variable "fname"{
  default = "krishna"
  }
variable "lname"{
  default = "maram"
  }
