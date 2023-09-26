class UserFullDataSerializer < ActiveModel::Serializer
  attributes :id, :username, :posts_counter, :created_at

  has_many :posts, serializer: PostSerializer

end
