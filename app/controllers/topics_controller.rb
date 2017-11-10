class TopicsController < ApplicationController
     before_action :currentuser
      def index

        #following if structre works when nested routes are supplied -->
         if params[:user_id]
           @user = User.find(params[:user_id])
           @topics = User.find(params[:user_id]).topics
          else
           @user = current_user
           @topics = current_user.topics
         end
      end

      def new
        @topic = Topic.new
      end

      def create
        #binding.pry
       if params[:topic][:title]!= ""  && params[:topic][:description]!= ""  && params[:topic][:date_of_event]!= ""
           topic = current_user.topics.create(topic_params)
           current_user.save
           Speakerarchive.create(user_id: current_user.id,topic_id: topic.id).save
           redirect_to topics_path
       else
           flash[:message] = "All fields must be filled"
           redirect_to new_topic_path(topic)
       end
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
        #binding.pry
        @topic = Topic.find(params[:id])
      end

      def destroy
        topic = Topic.find(params[:id])
        spRecord = Speakerarchive.find_by(topic_id: topic.id)
        topic.delete
        #Topic.save
        spRecord.delete
        redirect_to topics_path
      end

  private

       def topic_params
         params.require(:topic).permit(:title,:description,:date_of_event)
           #      binding.pry
       end

       def currentuser
         current_user
       end

  end
