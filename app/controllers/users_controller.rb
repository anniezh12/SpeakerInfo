class UsersController < ApplicationController
before_action :user_signin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    if current_user
      session.delete(:id)
    end
    redirect_to root_path
  end



private



  def user_signin
    user_signed_in?
   end

end
