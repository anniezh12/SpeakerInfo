class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
     @user.category.build()#nested attributes
  end

  def create
    @user = User.create(email: params[:email])
    @user.save
  end

  def edit
   @user = User.find(current_user.id)
     @user.category = Category.create()
  end

   def update
     binding.pry
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
          if (params[:category_id] != nil)
          params.require(:user).permit(:name,:education,:biography,:website,:category_id)
          else
          params.require(:user).permit(:name,:education,:biography,:website,category_attributes: [:title,:description,:prime_category])
          end
    end

    def user_signin
      user_signed_in?
    end

end
