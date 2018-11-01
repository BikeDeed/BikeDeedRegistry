#!/usr/bin/env bash
 
cp .env_development .env
touch log/development.log
> log/development.log # Clear out development log, otherwise it balloons
> log/test.log # Clear out test log too
redis-server&
# Prefix `bundle` with `exec` so unicorn shuts down gracefully on SIGTERM (i.e. `docker stop`)
exec bundle exec unicorn_rails -p 3001;
exec bundle exec rerun --background --dir app,db,lib --pattern '{**/*.rb}' -- bundle exec sidekiq;
