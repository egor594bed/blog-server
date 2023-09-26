class CommentSerializer < ActiveModel::Serializer
  attributes :id, :score, :text, :user_id, :post_id, :created_at

end
