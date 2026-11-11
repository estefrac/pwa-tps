#!/bin/bash

if [ ! -f manage.py ]; then
  django-admin startproject app .
fi

sleep 2

python manage.py makemigrations
python manage.py migrate --noinput

if [ -n "$DJANGO_SUPERUSER_USERNAME" ]; then
  echo "from django.contrib.auth.models import User; User.objects.filter(username='$DJANGO_SUPERUSER_USERNAME').exists() or User.objects.create_superuser('$DJANGO_SUPERUSER_USERNAME', '$DJANGO_SUPERUSER_EMAIL', '$DJANGO_SUPERUSER_PASSWORD')" | python manage.py shell
fi

python manage.py runserver 0.0.0.0:8000
