class WelcomeController < ApplicationController

    def index
    end

    def displayspeakers
      @users = User.all

      @topics = Topic.all

      if(@users || @topics)
          render json: @users,status: 201
      end
      #  respond_to do |format|
      #     format.html { render :index } # if no JSON take to show page
      #     format.json { render json: @users}
      #     end

end


end
