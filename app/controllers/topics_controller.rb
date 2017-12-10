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
          # @topic = Topic.find(params[])
           topic = current_user.topics.build(topic_params)
           if topic.save
               current_user.save
               id = topic.id
             end
           #populating Join Model "Speakerarchive", which joins a user/speaker with its topics
           Speakerarchive.create(user_id: current_user.id,topic_id: topic.id).save

           #populating  Join Model "forumtopic", which joins a topic with its forum and change the value of its custom attribute  "ratings" which lies in the join table

           forum = topic.forums.build(name: params[:topic][:forum],location: "San Jose");
           Forumtopic.create(forum_id: forum.id,topic_id: topic.id,ratings: params[:topic][:ratings]).save
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
        #following if is to accomodate nested routes
        if params[:user_id]
          @user = User.find(params[:user_id]);
          @topics = @user.topics
          @topic = Topic.find(params[:id]) if params[:id]
        else
          @topic = Topic.find(params[:id])
        end
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
         params.require(:topic).permit(:title,:description,:date_of_event,:forum,:ratings)
           #      binding.pry
       end

       def currentuser
         current_user
       end

  end
