resource "aws_instance" "web" {
  #ami           = data.aws_ami.web.id
  ami = "ami-09de362f44ba0a166"
  instance_type = "t2.micro"
  key_name = "terraform"
#  security_groups = ["sg-015fd4777c58fdc9c"]
provisioner "file" {
     source = "index.html"
     destination = "/tmp/index.html"
     on_failure = continue
  }
  connection {
     type = "ssh"
     host = self.public_ip
     user = "ec2-user"
     password = ""
     private_key = file("terraform.pem")
  }
}
/*
data "aws_ami" "web" {
  filter {
    name   = "name"
    values = ["cloudlinux-solo-8.6-x86_64.CPanel*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["679593333241"]
  most_recent = true
}
*/
