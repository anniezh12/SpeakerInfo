class UsersController < ApplicationController
#before_action :user_signin

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(email: params[:email])
    @user.save
  end

  def edit
   @user = User.find(current_user.id)
  end

 def update
   @user = User.find(current_user.id)
   @user.update(user_params)
   @user.save
   redirect_to user_path(@user)
 end

  def show

    @user = User.find(params[:id])

  end

private

  def user_params
    params.require(:user).permit(:name,:education,:biography,:website,category:[])
  end

  def user_signin
    user_signed_in?
   end

end
