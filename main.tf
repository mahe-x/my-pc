provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

provider "aws" {
  region  = "us-east-2"
  alias   = "ohio"
  profile = "default"
}
# locals {
#   servers = {
#     dev  = "t3.small"
#     prod = "t3.micro"
#     uat  = "c7i-flex.large"
#   }
# }


resource "aws_instance" "webserver1" {
  provider = aws.ohio
  #   for_each      = local.servers
  ami = "ami-04ea4e8270c27626c"
  #   instance_type = each.value
  instance_type = "t3.micro"
  #   region        = "ap-south-1"
  tags = {
    Name = "Webserver1"
    # Name = " Webserver-${each.key}-server"
  }
}

resource "aws_instance" "webserver2" {
  ami           = "ami-0476eb1110148a99f"
  instance_type = "t3.micro"
  #   region        = "us-east-1"
  tags = {
    Name = "Webserver2"
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