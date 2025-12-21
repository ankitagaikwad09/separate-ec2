output "frontend_url" {
  value = "http://65.0.32.13:3000"
}

output "backend_private_ip" {
  value = aws_instance.backend.private_ip
}
