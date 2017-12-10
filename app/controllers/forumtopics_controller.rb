class ForumtopicsController < ApplicationController

  def index
    @forumtopics = Forumtopics.all

  end

end
