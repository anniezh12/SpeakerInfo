class SpeakerarchivesController < ApplicationController

def index
    @speakerarchives = Speakerarchive.all
end

end
