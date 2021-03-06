resource "aws_security_group" "access-remote" {
    name = "access-remote"
    vpc_id = "${aws_vpc.main.id}"
    description = "Libera acesso remote via SSH e RDP"
    ingress {
       from_port = 22
       to_port = 22
       protocol = "tcp"
       cidr_blocks = "${var.cidr_blocks}"
    }
      ingress {
        from_port = 8
        to_port = 0
        protocol = "icmp"
        cidr_blocks = "${var.cidr_blocks}"
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "access-remote"
    }
}

resource "aws_security_group" "access-http" {
  name = "access-http"
  vpc_id = "${aws_vpc.main.id}"
  description = "Libera de acesso http"
  
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 9000
      to_port = 9000
      protocol = "tcp"
      cidr_blocks = "${var.cidr_blocks}"
  }
  tags = {
      Name = "Acesso http"
  }
}
