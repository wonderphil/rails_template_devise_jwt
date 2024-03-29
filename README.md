# Rails 6 Template with Devise and Devise-JWT

Firstly give credit where credit due, I have taken most of this from the repo [rootstrap](https://github.com/rootstrap/rails_api_base), did amazing template, but just didn't fit
what I was wanting.  This uses JWT instead of Devise Token Auth, didn't need Active Admin and no Auth required for the ExceptionHunter (though will be getting rid of this and replace with newrelic).

This works well with [Fuse React](https://fusetheme.com/admin-templates/react/) for Front End

## Things to do

- Deploy sample app
- add git hub action to build docker containers - working on now
- add Validation to models
- fix tests
- configure swagger
- upgrade ruby to version 3
- test in non-dev environment
- ~~add new relic~~
- ~~Config your timezone accordingly in `application.rb`.~~
- ~~replace puma with unicorn~~
- ~~add to docker~~
- ~~fix `rails code:analysis` robocop not working~~
- ~~setup github actions~~
- ~~update confirmation emails to look better~~
- ~~do password changes~~

## Setup required

### Credentials needed

- `secret_key_base` use `rake secret` to generate
- `devise_jwt_secret` use `rake secret` to generate
- `devise_secret` use `rake secret` to generate
- `mailgun_api_key` - only needed in production
- `db_password` - only needed in production
- `aws_key_id` - only needed in production
- `aws_secret_key` - only needed in production
- `new_relic_key` - used to send newrelic stats

### Environment Vars

These can be in `.env` files in the root of the app

- `SERVER_HOST=localhost`
- `ASSET_HOST` - used for servering email assets
- `SITE_EMAIL_ADDRESS=noreply@wonderphiltech.io`
- `APP_NAME=rails_template`
- `MAILGUN_DOMAIN=email.wonderphiltech.io`
- `REDIS_URL=` - only used in production
- `DB_USER=rails`
- `DB_HOST=locahost`
- `RAILS_MAX_THREADS=5` - only used in production
- `LISTEN_ON=3000` - only used in production
- `RAILS_ENV=` - only used in production
- `S3_BUCKET_NAME=` - only used in production
- `AWS_BUCKET_REGION=` - only used in production
- `FACEBOOK_LINK` - socail link for company
- `TWITTER_LINK` - socail link for company
- `INSTAGRAM_LINK` - socail link for company
- `LINKEDIN_LINK` - socail link for company
- `CONTACT_ADDRESS` - company address
- `CONTACT_US_LINK` - url to fe contact us page
- `TIMEZONE` - Time zone setting for Rails
- `DO_SLEEP=FALSE` - used in docker in the startup script
- `DO_DB_SETUP=TRUE` - used in docker in the startup script
- `DO_DB_RESET=FALSE` - used in docker in the startup script
- `DO_DB_DEPLOY=TRUE` - used in docker in the startup script
- `DO_DB_SEED=FALSE` - used in docker in the startup script
- `START_APP=TRUE` - used in docker in the startup script
- `RAILS_MASTER_KEY` - The master key for secrets file

### Run local Using Unicorn

```bash
unicorn -p 3000
```

### Build Docker Image

To build docker image and sort on Docker registry, use the following commands, replacing the registry name and user:

First log into your docker registry:

```bash
docker login -u docker_reg https://registry.wonderphiltech.io
```

Then if using m1 mac and plan on making contains to work on different platforms use the following:

```bash
docker buildx build --push --platform linux/arm64/v8,linux/amd64 -t registry.wonderphiltech.io/rails-api-template-x:latest . 
```

Otherwise if you on intel and only want intel build then run this:

```bash
docker build -t rails-api-template:latest .
```

Then once built with either command run this to push to registy:

```bash
docker tag rails-api-template:latest registry.wonderphiltech.io/rails-api-template:latest && \
docker push registry.wonderphiltech.io/rails-api-template:latest
```

### Run Docker Container

#### Without docker-compose

1. First make sure that `.docker.env` file is up to date
2. Then run the following command:
  
```bash
  docker run -it --env-file .env rails-api-template  
```

If you want to ssh to the container, then run this:

```bash
docker run -it --env-file .env rails-api-template /bin/ash
```

#### With Docker Compose

Just run Docker compose

```bash
docker-compose -f docker-compose up
```

## Gems

- [Annotate](https://github.com/ctran/annotate_models) for doc the schema in the classes
- [Better Errors](https://github.com/charliesome/better_errors) for a better error page
- [Brakeman](https://github.com/presidentbeef/brakeman) for static analysis security
- [Bullet](https://github.com/flyerhzm/bullet) help to kill N+1
- [Byebug](https://github.com/deivid-rodriguez/byebug) for debugging
- [DelayedJob](https://github.com/collectiveidea/delayed_job) for background processing
- [Devise](https://github.com/plataformatec/devise) for basic auth
- [Devise JWT](https://github.com/waiting-for-dev/devise-jwt) for api auth
- [Dotenv](https://github.com/bkeepers/dotenv) for handling environment variables
- [Draper](https://github.com/drapergem/draper) for decorators
- [ExceptionHunter](https://github.com/rootstrap/exception_hunter) for exception tracking
- [Factory Bot](https://github.com/thoughtbot/factory_bot) for testing data
- [Faker](https://github.com/stympy/faker) for generating test data
- [Jbuilder](https://github.com/rails/jbuilder) for json views
- [Letter Opener](https://github.com/ryanb/letter_opener) for previewing a mail in the browser
- [Mailgun Ruby](https://github.com/mailgun/mailgun-ruby) for sending emails through mailgun
- [newrelic-infinite_tracing](https://newrelic.com) for sending code and application monitoring metric to NewRelic
- [newrelic_rpm](https://newrelic.com) for sending code and application monitoring metric to NewRelic
- [Oj](https://github.com/ohler55/oj) for optimized json
- [Pagy](https://github.com/ddnexus/pagy) for pagination
- [Pry](https://github.com/pry/pry) for enhancing the ruby shell
- [Puma](https://github.com/puma/puma) for the server
- [Pundit](https://github.com/varvet/pundit) for authorization management
- [Rack CORS](https://github.com/cyu/rack-cors) for handling CORS
- [Rails Best Practices](https://github.com/flyerhzm/rails_best_practices) for rails linting
- [Reek](https://github.com/troessner/reek) for ruby linting
- [RSpec](https://github.com/rspec/rspec) for testing
- [Rspec API Doc Generator](https://github.com/zipmark/rspec_api_documentation) for API documentation
- [Rubocop](https://github.com/bbatsov/rubocop/) for ruby linting
- [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) adds other testing matchers
- [Simplecov](https://github.com/colszowka/simplecov) for code coverage
- [Webmock](https://github.com/bblimke/webmock) for stubbing http requests
- [YAAF](https://github.com/rootstrap/yaaf) for form objects
