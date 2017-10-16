class Topic < ApplicationRecord

  belongs_to :user
  #has_many :speakerarchives, through: :user
end
