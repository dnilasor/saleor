#!/usr/bin/env bash
set -e # exit on error

export RSA_PRIVATE_KEY=$(cat /etc/secrets/saleor-key)

python -c 'import os; print(os.environ.get("ALLOWED_HOSTS"))'
gunicorn --bind :$PORT --workers 4 --worker-class uvicorn.workers.UvicornWorker saleor.asgi:applicationg