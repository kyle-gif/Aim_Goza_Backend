FROM python:3.10

# 작업 디렉터리를 최상위 폴더로 설정
WORKDIR /app

# requirements.txt 복사 및 설치
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# 전체 프로젝트 복사
COPY . /app/

# PYTHONPATH 환경변수 설정 (옵션)
ENV PYTHONPATH=/app
ENV DJANGO_SETTINGS_MODULE=Aim_Goza_Backend.settings

# gunicorn 실행
CMD ["gunicorn", "Aim_Goza_Backend.wsgi:application", "--bind", "0.0.0.0:8000", "--chdir", "/app"]
