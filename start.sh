#!/bin/sh
set -e
python manage.py createcachetable django_cache_table || true
exec ./bin/run-all-in-one.sh