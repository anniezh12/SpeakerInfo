class Forumtopic < ApplicationRecord
  belongs_to :forum
  belongs_to :topic
  has_many :users, through: :topic
end
