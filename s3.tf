resource "aws_s3_bucket" "bucket-dev01" {
  bucket = "${var.aws_bucket}"
  acl = "private"

  tags = {
      Name = "bucket-${var.tag["vm-dev"]}"
  }
}
