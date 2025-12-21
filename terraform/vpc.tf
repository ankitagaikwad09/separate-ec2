resource "aws_default_vpc" "default" {}

resource "aws_default_subnet" "default" {
  availability_zone = "ap-south-1a"
}
