#!/bin/bash

echo "=== Container Status ==="
docker ps -a

echo -e "\n=== Container Logs ==="
docker logs aim-goza-backend

echo -e "\n=== Container Details ==="
docker inspect aim-goza-backend

echo -e "\n=== Testing Connection ==="
curl -v http://localhost:80

echo -e "\n=== Container Resource Usage ==="
docker stats aim-goza-backend --no-stream 