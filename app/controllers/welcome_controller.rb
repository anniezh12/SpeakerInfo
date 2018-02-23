class WelcomeController < ApplicationController

    def index
    end

    def displayspeakers
    end

    def jsondata
      @users = User.all

      @topics = Topic.all


          render json: @users,status: 201
      
      #  respond_to do |format|
      #     format.html { render :index } # if no JSON take to show page
      #     format.json { render json: @users}
      #     end
      #
    end


end
