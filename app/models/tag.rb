class Tag < ApplicationRecord
  has_many :tag_to_posts
  has_many :posts, through: :tag_to_posts
  validates :name, presence: true, uniqueness: true
end
