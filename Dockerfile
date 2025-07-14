# 베이스 이미지 설정 (경량화된 Python 이미지 추천)
FROM python:3.10

# 환경 변수 설정
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 작업 디렉토리 설정 및 생성
WORKDIR /app

# 의존성 파일 복사 및 설치
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# 프로젝트 전체 코드 복사
COPY . /app/

# Gunicorn 실행 (프로덕션 환경에서는 Gunicorn과 같은 WSGI 서버 사용을 권장)
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "aim_goza.wsgi:application"]