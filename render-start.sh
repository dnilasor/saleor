#!/usr/bin/env bash
set -e # exit on error

export RSA_PRIVATE_KEY=$(cat /etc/secrets/saleor-key)

python -c 'import os; print(os.environ.get("ALLOWED_HOSTS"))'
echo $ALLOWED_HOSTS
echo $RENDER_EXTERNAL_HOSTNAME

gunicorn --bind :$PORT --workers 4 --worker-class uvicorn.workers.UvicornWorker saleor.asgi:application

python manage.py populatedb --createsuperuser --withoutimages