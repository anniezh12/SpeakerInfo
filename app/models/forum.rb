class Forum < ApplicationRecord

   has_many :topics
   has_many :users, through: :topics

   def self.find_or_create_by(name)

       forum = Forum.find_by(name: name)
      if forum
         return forum
       else
         forum = Forum.create(name:name,location:"San Jose",number_of_speakers: 100,audience: 2000)
       end
       return forum
    end

end
