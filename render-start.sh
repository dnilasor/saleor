#!/usr/bin/env bash
set -e # exit on error

export FOO=$(cat .my-multiline-env-var)

python -c 'import os; print(os.environ.get("ALLOWED_HOSTS"))'
gunicorn --bind :$PORT --workers 4 --worker-class uvicorn.workers.UvicornWorker saleor.asgi:applicationg