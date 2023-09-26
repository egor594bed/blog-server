class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :score, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}

  after_create :increment_post_comments_counter
  after_destroy :decrement_post_comments_counter

  private

  def increment_post_comments_counter
    post.increment!(:comments_counter)
  end

  def decrement_post_comments_counter
    post.decrement!(:comments_counter)
  end
end
