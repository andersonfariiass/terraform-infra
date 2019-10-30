#Create resource instace
resource "aws_instance" "vm-dev" {
    ami = "${var.amis["ubuntu_ami"]}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    count = 2
    subnet_id = "${aws_subnet.main-private-1.id}"
    vpc_security_group_ids = ["${aws_security_group.access-remote.id}", "${aws_security_group.access-http.id}"]
    associate_public_ip_address = "true"
    tags = {
        Name = "${var.tag["vm-dev"]}-${count.index}"
        Dono = "${var.tag["vm-dev"]}"
        ScheduledStartStop = "True"
    }
    depends_on = ["aws_s3_bucket.bucket-dev01"]
}

resource "aws_instance" "vm-homologacao" {
  ami = "${var.amis["redhat_ami"]}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  count = 1
  subnet_id = "${aws_subnet.main-public-1.id}"
  vpc_security_group_ids = ["${aws_security_group.access-remote.id}", "${aws_security_group.access-http.id}"]
  associate_public_ip_address = "true"
  tags = {
      Name = "${var.tag["vm-homo"]}-${count.index}"
      Dono = "${var.tag["vm-homo"]}"
  }
}

resource "aws_instance" "vm-prod" {
  ami = "${var.amis["amazon_ami"]}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  count = 1
  subnet_id = "${aws_subnet.main-public-1.id}"
  vpc_security_group_ids = ["${aws_security_group.access-remote.id}", "${aws_security_group.access-http.id}"]
  associate_public_ip_address = "true"
  tags = {
      Name = "${var.tag["vm-prod"]}-${count.index}"
      Dono = "${var.tag["vm-prod"]}"
  }
  depends_on = ["aws_dynamodb_table.dynamodb-prod"]
}

