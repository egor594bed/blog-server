class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :posts_count, :created_at

end
