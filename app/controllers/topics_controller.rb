class TopicsController < ApplicationController
     before_action :currentuser
      def index
        @topics = Topic.all
      end

      def new
        @topic = Topic.new
      end

      def create
        @topic = current_user.topics.create(topic_params)
        current_user.save
        #binding.pry
        redirect_to topic_path(@topic)
      end

      def edit
        @topic = Topic.find(params[:id])
      end

      def update
        @topic = Topic.find(params[:id])

        @topic.update(topic_params)
        @topic.save
        redirect_to topic_path(@topic)
      end

      def show

        @topic = Topic.find_by(user_id: params[:user_id])
      end

  private

       def topic_params
         params.require(:topic).permit(:title,:description,:date_of_event)
           #      binding.pry
       end

       def currentuser
         user_id = current_user.id if current_user
       end

  end
