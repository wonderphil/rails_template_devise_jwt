#!/bin/ash

set -e
# USER=$API_DB_USER"_"$RAILS_ENV
# DB=$API_DB_DATABASE"_"$RAILS_ENV

# if [ $CHECK_PSQL_AVAILABLE = "TRUE" ]
# then
#   echo "Checking if Postgres is alive:"

#   #until PGPASSWORD="$API_DB_PASS" psql -h "$API_DB_HOST" -U "$USER" -d "$DB" -c '\q'; do
#   until PGPASSFILE="$API_DB_PASS_FILE" psql -h "$API_DB_HOST" -U "$USER" -d "$DB" -c '\q'; do
#     >&2 echo "Postgres is unavailable - sleeping"
#     sleep 5
#   done
#   echo "Postgres is alive!"
# else
#   echo "SKIPPING CHECK OF DATABASE BEING ALIVE"
# fi

# if [ $DO_DB_SETUP = "TRUE" ]
# then
#   echo "Checking if Database exists:"
#   #until PGPASSWORD="$API_DB_PASS" psql -h "$API_DB_HOST" -U "$USER" -lqt | cut -d \| -f 1 | grep -qw "$DB"; do
#   until PGPASSFILE="$API_DB_PASS_FILE" psql -h "$API_DB_HOST" -U "$USER" -lqt | cut -d \| -f 1 | grep -qw "$DB"; do
#     echo "Database doesn't exist, will run rails db:setup!"
#     rails db:setup
#     rails db:migrate
#   done
#   echo "Database has now been setup"
# else
#   echo "SKIPPING SETUP DATABASE"
# fi


# if [ $DO_DB_RESET = "TRUE" ]
# then
#   echo "db reset"
#   rails db:migrate
#   rails db:reset
#   echo "Database has now been reset"
# else
#   echo "SKIPPING RESETING DATABASE"
# fi


# if [ $DO_DB_DEPLOY = "TRUE" ]
# then
#   echo "Deploying Database migrations"
#   rails db:migrate
# else
#   echo "SKIPPING DATABASE MIGRATIONS"
# fi

# if [ $DO_DB_SEED = "TRUE" ]
# then
#   echo "db seed"
#   rails db:seed
#   echo "Database has now been seeded"
# else
#   echo "SKIPPING SEEDING DATABASE"
# fi

# if [ $START_APP = "TRUE" ]
# then
  echo "Now starting unicorn!"
  bundle exec unicorn -c config/unicorn.rb
# else
#   echo "NOT STARTING APP"
# fi