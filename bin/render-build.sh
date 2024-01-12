#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:drop
bundle exec rake db:create
bundle exec rake generate devise:install
bundle exec rake db:migrate
