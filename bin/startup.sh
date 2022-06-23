#!/bin/ash

set -e

if [ $DO_SLEEP = "TRUE" ]
then
  echo "Sleeping for debuging"
  sleep 90000
fi

rails db:environment:set RAILS_ENV=$RAILS_ENV

if [ $DO_DB_SETUP = "TRUE" ]
then
  echo "Running DB Setup for Environment " $RAILS_ENV
  RAILS_ENV=$RAILS_ENV rails db:setup
  rails db:migrate
  echo "Database has now been setup"
else
  echo "SKIPPING SETUP DATABASE"
fi


if [ $DO_DB_RESET = "TRUE" ]
then
  echo "db reset"
  rails db:migrate
  rails db:reset
  echo "Database has now been reset"
else
  echo "SKIPPING RESETING DATABASE"
fi


if [ $DO_DB_DEPLOY = "TRUE" ]
then
  echo "Deploying Database migrations"
  rails db:migrate
else
  echo "SKIPPING DATABASE MIGRATIONS"
fi

if [ $DO_DB_SEED = "TRUE" ]
then
  echo "db seed"
  rails db:seed
  echo "Database has now been seeded"
else
  echo "SKIPPING SEEDING DATABASE"
fi

if [ $START_APP = "TRUE" ]
then
  echo "Now starting unicorn!"
  bundle exec unicorn -c config/unicorn.rb
else
  echo "NOT STARTING APP"
fi