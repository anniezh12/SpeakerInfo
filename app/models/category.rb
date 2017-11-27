class Category < ApplicationRecord
  has_many :users
  has_many :speakerarchives, through: :users
  validates :title, uniqueness: true
end
