namespace :code do
  desc 'Run code quality tools'
  task analysis: :environment do
    sh 'bundle exec brakeman . -z -q'
    sh 'bundle exec reek app lib public spec tmp'
    sh 'bundle exec rails_best_practices .'
    sh 'bundle exec rubocop .'
    sh 'bundle exec rails db:find_indexes'
  end
end
