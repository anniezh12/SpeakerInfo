class UsersController < ApplicationController
before_action :user_signin
  def index
    @users = User.all
  end

  def new
    if current_user
    @user = current_user
  else
    @user = User.new
  end

  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    @user.save

  redirect_to user_path(@user)

  end

  def show
    @user = User.find(current_user.id)
  end
private

  def user_params
    params.require(:user).permit(:name,:email,:education,:biography,:website,category:[])
  end

  def user_signin
    user_signed_in?
   end

end
