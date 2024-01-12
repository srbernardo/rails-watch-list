#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:reset
bundle exec rails generate devise:install
bundle exec rake db:migrate
