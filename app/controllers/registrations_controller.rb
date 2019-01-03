class RegistrationsController < Devise::RegistrationsController
	
  def new
    super
  end

	def create
    super
    if @user.persisted?
      #binding.pry
      puts "^^&&&&&&&&&&&&&&&&&&&&&&&&&&^^^^^^^^+="
      WelcomeUserMailer.welcome.deliver_now
    end

  end

   def update
    super
  end

  def send_enabled_message(user)
    @user = user
   puts @user
  end

  def send_new_user_message(user)
    @user = user
    mail(:to => 'aniqaelahi@yahoo.com', :subject => "New User created please review and enable.")
  end


  

end
