resource "aws_instance" "backend" {
  ami                    = "ami-02b8269d5e85954ef"
  instance_type          = "t3.micro"
  key_name               = var.key_name
  subnet_id              = aws_default_subnet.default.id
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
  user_data              = file("user_data/flask.sh")

  tags = {
    Name = "flask-backend"
  }
}

resource "aws_instance" "frontend" {
  ami                    = "ami-02b8269d5e85954ef"
  instance_type          = "t3.micro"
  key_name               = var.key_name
  subnet_id              = aws_default_subnet.default.id
  vpc_security_group_ids = [aws_security_group.frontend_sg.id]

  user_data = templatefile("user_data/express.sh", {
    backend_url = "http://${aws_instance.backend.private_ip}:5000"
  })

  tags = {
    Name = "express-frontend"
  }
}
