source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'
gem 'rails', '~> 6.1.6'

gem 'active_storage_base64', '~> 1.0.0'
gem 'aws-sdk-s3', '~> 1.75', require: false
gem 'bootsnap', '~> 1.4', '>= 1.4.5'
gem 'delayed_job_active_record', '~> 4.1', '>= 4.1.5'
gem 'devise'
gem 'devise-jwt'
gem 'draper', '~> 4.0', '>= 4.0.1'
gem 'exception_hunter', '~> 1.0', '>= 1.0.1'
gem 'jbuilder', '~> 2.10'
gem 'mailgun-ruby', '~>1.2.5'
gem 'newrelic-infinite_tracing'
gem 'newrelic_rpm'
gem 'oj', '~> 3.9', '>= 3.9.2'
gem 'pagy', '~> 3.7', '>= 3.7.5'
gem 'pg'
gem 'pundit', '~> 2.1'
gem 'rack-cors', '~> 1.0', '>= 1.0.6'
gem 'unicorn'
gem 'yaaf', '~> 0.1'

group :development, :test do
  gem 'annotate', '~> 3.0', '>= 3.0.3'
  gem 'bullet', '~> 6.1'
  gem 'dotenv-rails', '~> 2.7.6'
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  gem 'pry-byebug', '~> 3.9', platform: :mri
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec_api_documentation', '~> 6.1.0'
  gem 'rspec-rails', '~> 4.1'
end

group :development do
  gem 'better_errors', '~> 2.5', '>= 2.5.1'
  gem 'binding_of_caller', '~> 0.8.0'
  gem 'brakeman', '~> 5.1'
  gem 'i18n-tasks', '~> 0.9.30'
  gem 'letter_opener', '~> 1.7'
  gem 'listen', '~> 3.2'
  gem 'lol_dba'
  gem 'rails_best_practices', '~> 1.20'
  gem 'reek', '~> 5.5'
  gem 'rubocop-rails', '~> 2.12', require: false
  gem 'rubocop-rootstrap', '~> 1.2'
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

group :test do
  gem 'faker', '~> 2.13'
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
  gem 'simplecov', '~> 0.13.0', require: false
  gem 'webmock', '~> 3.7', '>= 3.7.6'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
