class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :posts_counter, :created_at

end
