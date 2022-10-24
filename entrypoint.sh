#!/bin/bash
set -e

#####
## This script will run everytime the container starts.
## Essentially, we use it to run migrations.
#####

# Remove a potentially pre-existing server.pid for Rails.
rm -f /Sopha-test-api/tmp/pids/server.pid

# https://github.com/ufoscout/docker-compose-wait
# /usr/bin/wait



# #Execute assets
# bundle exec rake assets:precompile

#create database
bundle exec rake db:create

# Execute migrations
bundle exec rake db:migrate

if [[ $? != 0 ]]; then
  echo
  echo "== Failed to migrate. Running setup first."
  echo
  bundle exec rake db:setup
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"