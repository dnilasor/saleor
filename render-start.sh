#!/usr/bin/env bash
set -e # exit on error
ALLOWED_HOSTS=$RENDER_EXTERNAL_HOSTNAME

gunicorn --bind :$PORT --workers 4 --worker-class uvicorn.workers.UvicornWorker saleor.asgi:application