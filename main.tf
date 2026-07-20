provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver1" {
  ami           = "ami-0476eb1110148a99f"
  instance_type = "t3.small"

tags = {
    Name = "webserver1"
  }
}

resource "aws_s3_bucket" "bucket-test" {
    bucket = "mahesh-s3bucket-1996test"
}

output "instance_name" {
  value = aws_instance.webserver1.tags["Name"]
}
output "instance_type" {
  value = aws_instance.webserver1.instance_type
  sensitive = true
}


