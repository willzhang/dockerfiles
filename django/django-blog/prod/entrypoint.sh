#!/usr/bin/env bash

set -e

if [ "$SQL_ENGINE" = "django.db.backends.mysql" ]
then
    echo "Waiting for mysql..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "mysql started"
fi

# init db
if [ ! -f migrate.log ];then
    echo "Make makemigrations..."
    python manage.py makemigrations && python manage.py migrate | tee -a migrate.log
fi

# init static
if [ "`ls -A collected_static`" = "" ]; then
    echo "collectstatic..."
    python manage.py collectstatic --no-input
fi

echo "Starting app..."
gunicorn --user app --workers=3 --bind=0.0.0.0:8000 my_blog.wsgi:application
