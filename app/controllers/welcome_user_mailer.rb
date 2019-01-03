class WelcomeUserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_user_mailer.welcome.subject
  

  def welcome

    # @user = user
    # if @user.persisted?
    puts "######################################################}"
    
    mail to: "aniqaelahi@yahoo.com", subject: "Welcome Home"
    #end
  end
end
