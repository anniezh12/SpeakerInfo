class ForumController < ApplicationController

def index
 @forums = Forum.all
end

end
