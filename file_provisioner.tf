resource "aws_instance" "web" {
  #ami           = data.aws_ami.web.id
  ami = "ami-09de362f44ba0a166"
  instance_type = "t2.micro"
  key_name = "terraform"
}
