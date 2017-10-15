class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    @user.save

  redirect_to user_path(@user)
  end


    
    private

    def user_params
      params.require(:user).permit(:name,:email,:education,:biography,:website,category:[])
    end

end
