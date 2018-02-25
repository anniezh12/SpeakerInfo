class UserSerializer < ActiveModel::Serializer
  attributes :id,:name,:email,:category
  has_many :topics
end
