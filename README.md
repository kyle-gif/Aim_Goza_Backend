# Aim Goza Backend

"Aim Goza" 게임의 기록과 리더보드를 관리하기 위한 Django 및 Django REST Framework 기반의 백엔드 프로젝트입니다. 게임 모드(그리드, 트랙)별 점수를 추적하며 REST API와 HTML 기반의 리더보드 페이지를 제공합니다.

## 주요 기능

- **RESTful API**: 게임 점수 기록 생성 및 점수 리스트 조회 기능을 제공합니다.
- **스코어보드 페이지**: 브라우저에서 바로 확인할 수 있는 HTML 리더보드를 제공합니다.
- **게임 모드 지원**: `grid` 모드와 `track` 모드의 점수를 별도로 관리할 수 있습니다.
- **Docker 지원**: `Dockerfile` 및 `docker-compose.yml`이 구성되어 있어 배포 및 개발 환경 구성이 매우 간편합니다.
- **AWS 배포 스크립트**: 편의를 위한 AWS EC2 배포 셸 스크립트가 포함되어 있습니다.

## 기술 스택

- Python 3
- Django 5.2.3
- Django REST Framework (DRF)
- SQLite (기본 데이터베이스)
- Gunicorn (Production WSGI 서버)
- Docker & Docker Compose

## API 엔드포인트

### 1. 점수 API (JSON)

- **URL**: `/api/scores/`
- **메서드**: `GET`, `POST`
- **권한**: `AllowAny` (인증 불필요 / CORS 허용)
- **GET 응답**: 최신 등록순으로 정렬된 전체 점수 목록을 반환합니다.
- **POST 요청 바디 예시** (JSON):
  ```json
  {
    "username": "player1",
    "score": 1500,
    "gameType": "grid"
  }
  ```

### 2. 스코어보드 HTML 페이지

- **URL**: `/scores/`
- **메서드**: `GET`
- **쿼리 파라미터**:
  - `gameType`: `grid` (기본값) 또는 `track`
  - `sort`: `score` (기본값 - 점수 높은 순) 또는 `date` (최신 등록 순)
- 조건에 맞는 상위 10개의 점수 데이터를 HTML 파일로 반환합니다.

## 로컬 개발 환경 설정

### 1. Docker를 사용한 실행 (권장)

Docker Compose를 사용하면 의존성 설치 없이 명령어 한 번으로 서버를 실행할 수 있습니다.

```bash
docker-compose up -d --build
```

서버는 기본적으로 `http://localhost:8000` 에서 실행됩니다.

### 2. 수동 실행 (Virtual Environment)

1. 가상 환경 생성 및 활성화:
   ```bash
   python -m venv venv
   source venv/bin/activate  # Windows: venv\Scripts\activate
   ```
2. 패키지 설치:
   ```bash
   pip install -r requirements.txt
   ```
3. 데이터베이스 마이그레이션 적용:
   ```bash
   python manage.py migrate
   ```
4. 개발 서버 실행:
   ```bash
   python manage.py runserver
   ```
   서버 실행 후 브라우저에서 `http://127.0.0.1:8000/api/scores/` 로 접속할 수 있습니다.

## 배포 가이드 (AWS)

AWS EC2(또는 유사한 Linux 인스턴스)에 쉽게 배포할 수 있는 셸 스크립트가 준비되어 있습니다:

- `install_docker_compose.sh`: 인스턴스에 Docker 및 Docker Compose를 설치합니다.
- `deploy_aws.sh` / `deploy_aws_port80.sh`: Docker 빌드를 수행하고 8000번 혹은 80번 포트로 컨테이너를 배포합니다.
- 자세한 AWS 배포 명령어는 `aws_commands.md` 파일을 참고해주세요.
