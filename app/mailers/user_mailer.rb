class UserMailer < Devise::Mailer
  include Devise::Controllers::UrlHelpers # eg. `confirmation_url`
  default template_path: 'devise/mailer'
  default from: ENV['SITE_EMAIL_ADDRESS']
  default reply_to: ENV['SITE_EMAIL_ADDRESS']
  layout  'mailer_user'
end
