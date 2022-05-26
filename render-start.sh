#!/usr/bin/env bash
set -e # exit on error
ALLOWED_HOSTS=".onrender.com"

echo $ALLOWED_HOSTS
gunicorn --bind :$PORT --workers 4 --worker-class uvicorn.workers.UvicornWorker saleor.asgi:application