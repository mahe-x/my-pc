provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
}

resource "aws_instance" "webserver" {
  provider               = aws.virginia
  ami                    = "ami-0476eb1110148a99f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0dedd49f83815ac2d"]
  key_name               = "testing"

  # connection {
  #   type        = "ssh"
  #   user        = "ec2-user"
  #   private_key = file("/home/ec2-user/mycode/instance-key.pem")
  # host        = self.public_ip
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo yum update -y",
  #     "sudo yum install httpd -y",
  #     "sudo systemctl start httpd",
  #     "sudo systemctl enable httpd",
  #     "echo \"<h1>Welcome </h1>\" | sudo tee /var/www/html/index.html"
  #   ]
  # }
  # user_data     = file("${path.module}/userdata.txt")
  tags = {
    Name = "mumbai-webserver"
  }

}

