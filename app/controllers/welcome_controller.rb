class WelcomeController < ApplicationController

    def index
    end

    def displayspeakers
      @users = User.all
      @topics = Topic.all
    end

end
