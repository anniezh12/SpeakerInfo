class Speakerarchive < ApplicationRecord
  has_many :users
  has_many :topics
  has_many :categories, through: :topics
end
