class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category, primary_key: :key, foreign_key: :category_key
  has_many :comments, dependent: :destroy

  after_create :increment_user_post_counter
  after_destroy :decrement_user_post_counter

  private

  def increment_user_post_counter
    user.increment!(:posts_counter)
  end

  def decrement_user_post_counter
    user.decrement!(:posts_counter)
  end
end
