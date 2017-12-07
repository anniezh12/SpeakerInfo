class Forumtopic < ApplicationRecord
  belongs_to :forum
  belongs_to :topic
end
