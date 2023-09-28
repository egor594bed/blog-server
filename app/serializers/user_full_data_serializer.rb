class UserFullDataSerializer < ActiveModel::Serializer
  attributes :id, :username, :posts_count, :created_at

  has_many :posts, serializer: PostSerializer

end
