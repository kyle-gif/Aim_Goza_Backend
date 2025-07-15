#!/bin/bash

echo "Installing latest Docker Compose..."

# 기존 docker-compose 제거
sudo apt-get remove docker-compose -y

# 최신 Docker Compose 다운로드
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# 실행 권한 부여
sudo chmod +x /usr/local/bin/docker-compose

# 심볼릭 링크 생성
sudo ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose

# 버전 확인
docker-compose --version

echo "Docker Compose installation completed!" 