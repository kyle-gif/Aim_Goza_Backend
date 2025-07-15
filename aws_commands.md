# AWS 서버 배포 명령어

## 1. 기본 배포 (포트 80)
```bash
chmod +x deploy_aws_port80.sh
./deploy_aws_port80.sh
```

## 2. 수동 배포
```bash
# 기존 컨테이너 정리
docker stop aim-goza-backend 2>/dev/null || true
docker rm aim-goza-backend 2>/dev/null || true
docker rmi aim-goza-backend 2>/dev/null || true

# 새 이미지 빌드
docker build -f Dockerfile.prod -t aim-goza-backend .

# 컨테이너 실행 (포트 80)
docker run -d \
  --name aim-goza-backend \
  -p 80:8000 \
  -e DEBUG=False \
  --restart unless-stopped \
  aim-goza-backend
```

## 3. 디버깅
```bash
# 컨테이너 상태 확인
docker ps -a

# 로그 확인
docker logs aim-goza-backend

# 실시간 로그 확인
docker logs -f aim-goza-backend

# 디버깅 스크립트 실행
chmod +x debug_container.sh
./debug_container.sh
```

## 4. 컨테이너 관리
```bash
# 컨테이너 중지
docker stop aim-goza-backend

# 컨테이너 시작
docker start aim-goza-backend

# 컨테이너 재시작
docker restart aim-goza-backend

# 컨테이너 제거
docker rm -f aim-goza-backend
```

## 5. 문제 해결
```bash
# 컨테이너 내부 접속
docker exec -it aim-goza-backend bash

# Django 명령어 실행
docker exec aim-goza-backend python manage.py migrate
docker exec aim-goza-backend python manage.py collectstatic --noinput

# 포트 확인
netstat -tlnp | grep :80
```

## 6. 보안 그룹 설정
AWS EC2 보안 그룹에서 다음 포트를 열어야 합니다:
- 포트 80 (HTTP)
- 포트 22 (SSH) 