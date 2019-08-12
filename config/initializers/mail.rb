

if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.gmail.com',
    domain: 'gmail.com',
    port: 587,
    user_name: 'tseniors777@gmail.com',
    password: 'T-yuuma777',
    authentication: 'plain',
    enable_starttls_auto: true
  }
#elsif Rails.env.development?
#  ActionMailer::Base.delivery_method = :letter_opener
elsif Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.gmail.com',
    domain: 'gmail.com',
    port: 587,
    user_name: 'tseniors777@gmail.com',
    password: 'T-yuuma777',
    authentication: 'plain',
    enable_starttls_auto: true
  }
else
  ActionMailer::Base.delivery_method = :test
end
