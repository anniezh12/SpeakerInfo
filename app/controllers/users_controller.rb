class UsersController < ApplicationController

  def index
    @users = User.all
    @user=User.first
      respond_to do |format|
         format.json { render json: @users }
         format.html { render :index } # if no JSON take to show page
      end

  end


  def new
    @user = User.new
  end

  def create
    # @user = User.create(email: params[:email])
    # @user.save
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


    def user_with_most_lectures
      if User.all.count > 0
          @user = User.find(User.user_with_most_lectures)
      else
        redirect_to '/'
      end
    end

    def user_with_least_lectures
      @user = User.find(User.user_with_least_lectures)
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
