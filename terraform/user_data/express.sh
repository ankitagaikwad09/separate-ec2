#!/bin/bash
apt update -y
apt install -y docker.io
systemctl start docker
systemctl enable docker

docker run -d \
  -p 3000:3000 \
  -e BACKEND_URL=${backend_url} \
  your-dockerhub-username/express-frontend
