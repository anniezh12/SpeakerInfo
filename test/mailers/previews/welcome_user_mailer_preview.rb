# Preview all emails at http://localhost:3000/rails/mailers/welcome_user_mailer
class WelcomeUserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/welcome_user_mailer/welcome
  def welcome
    WelcomeUserMailer.welcome
  end

end
