provider "aws" {
  region = "us-east-1"
}

# locals {
#   servers = {
#     dev  = "t3.small"
#     prod = "t3.micro"
#     uat  = "c7i-flex.large"
#   }
# }


resource "aws_instance" "webserver1" {
  #   for_each      = local.servers
  ami = "ami-0476eb1110148a99f"
  #   instance_type = each.value
  instance_type = "t3.micro"
  tags = {
    Name = "Webserver1"
    # Name = " Webserver-${each.key}-server"
  }
}

# resource "aws_s3_bucket" "bucket-test" {
#     bucket = "mahesh-s3bucket-1996test"
#     depends_on = [aws_instance.webserver1]
# }

# output "instance_id" {
# description = " The id of instance"
# value = aws_instance.webserver1[*].id
# }