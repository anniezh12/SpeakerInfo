class TopicSerializer < ActiveModel::Serializer
  attributes :id,:title,:description,:date_of_event,:forum
end
