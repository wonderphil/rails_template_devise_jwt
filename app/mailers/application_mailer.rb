class ApplicationMailer < ActionMailer::Base
  default from: ENV['SITE_EMAIL_ADDRESS']
  layout 'mailer'
end
