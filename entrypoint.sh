#!/bin/sh
set -e

until pg_isready -h db -p 5432 -U postgres; do
  echo "Waiting for PostgreSQL..."
  sleep 1
done

exec bundle exec rackup -o 0.0.0.0
