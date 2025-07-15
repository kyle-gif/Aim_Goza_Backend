#!/bin/bash

echo "Deploying to AWS server..."

# 기존 컨테이너 중지 및 제거
docker stop aim-goza-backend 2>/dev/null || true
docker rm aim-goza-backend 2>/dev/null || true

# 기존 이미지 제거
docker rmi aim-goza-backend 2>/dev/null || true

# 새 이미지 빌드 (프로덕션용)
echo "Building Docker image..."
docker build -f Dockerfile.prod -t aim-goza-backend .

# 컨테이너 실행
echo "Starting container..."
docker run -d \
  --name aim-goza-backend \
  -p 8000:8000 \
  -e DEBUG=False \
  -e DJANGO_SETTINGS_MODULE=Aim_Goza_Backend.settings \
  aim-goza-backend

echo "Deployment completed!"
echo "Container status:"
docker ps

echo "Logs:"
docker logs aim-goza-backend 