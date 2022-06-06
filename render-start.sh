#!/usr/bin/env bash
set -e # exit on error

export RSA_PRIVATE_KEY=$(cat /etc/secrets/saleor-key)

python -c 'import os; print(os.environ.get("ALLOWED_HOSTS"))'
echo $ALLOWED_HOSTS
echo $RENDER_EXTERNAL_HOSTNAME

subcommand=$1
case $subcommand in
  server)
    gunicorn --bind :$PORT --workers 4 --worker-class uvicorn.workers.UvicornWorker saleor.asgi:application
    ;;
  worker)
    celery -A saleor --app=saleor.celeryconf:app worker --loglevel=info -E
    ;;
  *)
    echo "Unknown subcommand"
    ;;
esac
