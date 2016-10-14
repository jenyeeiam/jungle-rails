class Notifier < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email()
    @url  = 'http://example.com/login'
    mail(to: 'smtp://127.0.0.1:5001', subject: 'Welcome to My Awesome Site')
  end

end
