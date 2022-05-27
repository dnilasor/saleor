#!/usr/bin/env bash
set -e # exit on error

export RSA_PRIVATE_KEY=$(cat /etc/secrets/saleor-key)
echo $RSA_PRIVATE_KEY

pip3 install -r requirements.txt
python manage.py migrate --no-input