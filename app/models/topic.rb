class Topic < ApplicationRecord

  belongs_to :user
  has_many :forums

  validates :title, presence: true
  validates :title,uniqueness: true
end
