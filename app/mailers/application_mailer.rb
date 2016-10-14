class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'mailer'
end

# mailcatcher --ip=0.0.0.0 --smtp-port 5001 --http-port 3001
