class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :user_id, :category_key, :comments_counter

  has_many :comments, serializer: CommentSerializer 
end
