class WishSerializer < ActiveModel::Serializer
  attributes :id, :goal
  has_one :user
end
