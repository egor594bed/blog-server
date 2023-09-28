class Post < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :category, primary_key: :key, foreign_key: :category_key
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy

end
