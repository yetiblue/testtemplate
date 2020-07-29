#!/bin/sh

set -e

if [ $DEBUG = "true" ]; then
  echo "Starting backend API in debug mode..."
  python manage.py migrate
  python manage.py runserver 0.0.0.0:8000
else
  echo "!!!PRODUCTION!!! Starting backend API in production mode..."
  exec /usr/local/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
    --name $NAME \
    --workers $NUM_WORKERS \
    --user=$USER --group=$GROUP \
    --bind=unix:$SOCKFILE \
    --log-level=debug \
    --log-file=-
fi

