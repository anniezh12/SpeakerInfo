class ApplicationMailer < ActionMailer::Base
  default from: 'aniqaelahi@yahoo.com'
  layout 'mailer'

  def sample_email(user)
    @user = user
    mail(to: @user.emil,subject: 'Test Email')
end
end
