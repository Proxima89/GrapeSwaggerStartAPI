#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails
rm -f /rails/tmp/pids/server.pid

# Wait for PostgreSQL
until pg_isready -h $PRIMARY_DATABASE_HOST -U postgres
do
  echo "Waiting for PostgreSQL to be ready..."
  sleep 2
done

# Set up the database
bundle exec rails db:prepare

# Then exec the container's main process
exec "$@"