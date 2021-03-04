#!/usr/bin/env bash

set -e

# init nginx
if [ ! -d /run/nginx ]; then
    mkdir -p /run/nginx
    chown -R nginx.nginx /run/nginx
fi

# init db
if [ ! -f /blog/db.sqlite3 ];then
  python manage.py makemigrations
  python manage.py migrate
fi

# init static
if [ ! -d /blog/collectstatic ]; then
    python manage.py collectstatic --no-input
fi

nginx
gunicorn --workers=3 --bind=0.0.0.0:8000 my_blog.wsgi:application
