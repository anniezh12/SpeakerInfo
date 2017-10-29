class SpeakerarchivesController < ApplicationController

def index
  #binding.pry
  @speakerarchives = Speakerarchive.all
end

end
