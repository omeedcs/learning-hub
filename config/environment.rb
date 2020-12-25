# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}