class TopicsController < ApplicationController

     before_action :currentuser

      def index
        #following if structre works when nested routes are supplied
         if params[:user_id]
           @user = User.find(params[:user_id])
           @topics = User.find(params[:user_id]).topics
          else
           @user = current_user
           @topics = current_user.topics
         end
       @topic =Topic.new
    end

      def new
        @topic = Topic.new
        @topics = current_user.topics
      end

      def create

            if params[:title]!= ""  && params[:description]!= ""  && params[:date_of_event]!= "" && params[:forum] != ""
               # @topic = Topic.find(params[])
              @topic = current_user.topics.build(topic_params)
              @topic.save
              current_user.save
              if @topic.save
                render json: @topic, status: 201
             end
                #populating Join Model "Speakerarchive", which joins a user/speaker with its topics
                Speakerarchive.create(user_id: current_user.id,topic_id: @topic.id).save

                #populating  Join Model "forumtopic", which joins a topic with its forum and change the value of its custom attribute  "ratings" which lies in the join table

                # @forum = @topic.forums.build(name: params[:forum],location: "Saratoga");
                # @forum.save
                #
                # Forumtopic.create(forum_id: @forum.id,topic_id: @topic.id,ratings: params[:forum_rating]).save

              # redirect_to topics_path
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
        redirect_to topic_path(@topic)
      end

      def show
    #following if is to accomodate nested routes
        if params[:user_id]
          @user = User.find(params[:user_id]);
          @topics = @user.topics
          @topic = Topic.find(params[:id]) if params[:id]
          nextid= params[:id]+1
          while !Topic.find(nextid)
            nextid = nextid+1
          end

          end
          @next = Topic.find(nextid)
        else
          @topic = Topic.find(params[:id])
        end

        # respond_to do |format|
        #   format.html{ render :show}
        #   format.json{ render json: @topic}
        # end
      end

      def destroy
        @topic = Topic.find(params[:id])
        @spRecord = Speakerarchive.find_by(topic_id: @topic.id)
        @topic.delete
        @spRecord.delete
        redirect_to topics_path
      end



  private



       def topic_params
         params.permit(:title,:description,:date_of_event,:forum)
       end

       def currentuser
         current_user
       end

  end
