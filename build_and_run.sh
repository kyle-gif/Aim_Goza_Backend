#!/bin/bash

echo "Building Docker image..."
docker build -t aim-goza-backend .

echo "Running Docker container..."
docker run -p 8000:8000 -e DEBUG=True aim-goza-backend 