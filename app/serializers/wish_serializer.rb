class WishSerializer < ActiveModel::Serializer
  attributes :id, :wish
  has_one :user
end
