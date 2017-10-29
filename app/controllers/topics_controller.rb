class TopicsController < ApplicationController
     before_action :currentuser
      def index
        @topics = current_user.topics
      end

      def new
        @topic = Topic.new
      end

      def create
        #binding.pry
        if params[:topic][:title]!= ""  && params[:topic][:description]!= ""  && params[:topic][:date_of_event]!= ""
            @topic = current_user.topics.create(topic_params)
            current_user.save
            Speakerarchive.create(user_id: current_user.id,topic_id: @topic.id).save
            redirect_to topics_path
        else
            flash[:message] = "All fields must be filled"
            redirect_to new_topic_path(@topic)
        end
       end

      def edit
        @topic = Topic.find(params[:id])
      end

      def update
        @topic = Topic.find(params[:id])
        @topic.update(topic_params)
        @topic.save
        redirect_to topics_path
      end

      def show
        #@topic = Topic.find(params[:id])
      end

      def destroy
        binding.pry
        @topic = Topic.find(params[:id])
        @topic.delete
        redirect_to root_path
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
