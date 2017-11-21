class UsersController < ApplicationController

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
     #binding.pry
     @user = User.find(current_user.id)
          if (params[:user][:category_id] != "")
            @user.update(user_params)
          else
             @category = Category.new(title: params[:user][:category_attributes][:title],description: params[:user][:category_attributes][:description],prime_category: params[:user][:category_attributes][:prime_category])
             @category.save
             @user.update(user_params)
             # even thought a user has been updated but it hasnt been associated a category_id yet , after creating a new category with the supplied attributes we will use its id as follows
             @user.category_id = @category.id
          end
          @user.save
          binding.pry
     redirect_to user_path(@user)
   end

    def show
      @user = User.find(params[:id])
      binding.pry
    end

private

    def user_params

          if (params[:user][:category_id] != "")
          params.require(:user).permit(:name,:education,:biography,:website,:category_id)
          else
          params.require(:user).permit(:name,:education,:biography,:website,category_attributes: [:title,:description,:prime_category])
          end
    end

    def user_signin
      user_signed_in?
    end

end
