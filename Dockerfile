FROM python:3.10

# 작업 디렉터리를 최상위 폴더로 설정
WORKDIR /app

# requirements.txt 복사 및 설치
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# 전체 프로젝트 복사
COPY . /app/

# PYTHONPATH 환경변수 설정
ENV PYTHONPATH=/app
ENV DJANGO_SETTINGS_MODULE=Aim_Goza_Backend.settings

# 데이터베이스 마이그레이션 및 정적 파일 수집을 위한 스크립트 생성
RUN echo '#!/bin/bash\n\
python manage.py migrate\n\
python manage.py collectstatic --noinput\n\
exec gunicorn Aim_Goza_Backend.wsgi:application --bind 0.0.0.0:8000 --chdir /app' > /app/start.sh

RUN chmod +x /app/start.sh

# 스크립트 실행
CMD ["/app/start.sh"]
