class Category < ApplicationRecord
  self.primary_key = 'key'
  has_many :posts, foreign_key: :category_key, dependent: :destroy
end
