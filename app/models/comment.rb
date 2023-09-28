class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :user

  validates :score, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
  
end
